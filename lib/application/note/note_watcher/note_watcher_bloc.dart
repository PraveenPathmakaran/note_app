import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:note_app/domain/notes/i_note_repository.dart';

import '../../../domain/notes/note.dart';
import '../../../domain/notes/note_failure.dart';

part 'note_watcher_bloc.freezed.dart';
part 'note_watcher_event.dart';
part 'note_watcher_state.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository _noteRepository;

  StreamSubscription<Either<NoteFailure, KtList<Note>>>?
      _noteStreamSubscription;
  NoteWatcherBloc(this._noteRepository)
      : super(const NoteWatcherState.initial()) {
    on<NoteWatcherEvent>((event, emit) async {
      await event.map(
        watchAllStarted: (value) async {
          emit(const NoteWatcherState.loadInProgress());
          await _noteStreamSubscription?.cancel();
          _noteStreamSubscription = _noteRepository.watchAll().listen(
              (failureOrNotes) =>
                  add(NoteWatcherEvent.notesReceived(failureOrNotes)));
        },
        watchUncompletedStarted: (value) async {
          emit(const NoteWatcherState.loadInProgress());
          await _noteStreamSubscription?.cancel();
          _noteStreamSubscription = _noteRepository.watchUncompleted().listen(
              (failureOrNotes) =>
                  add(NoteWatcherEvent.notesReceived(failureOrNotes)));
        },
        notesReceived: (value) async {
          value.failureOrNotes.fold(
            (f) => emit(NoteWatcherState.loadFailure(f)),
            (notes) => emit(NoteWatcherState.loadSuccess(notes)),
          );
        },
      );
    });
  }

  @override
  Future<void> close() async {
    await _noteStreamSubscription?.cancel();
    return super.close();
  }
}
