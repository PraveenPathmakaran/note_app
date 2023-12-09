import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:note_app/domain/notes/value_objects.dart';

import '../../../domain/notes/i_note_repository.dart';
import '../../../domain/notes/note.dart';
import '../../../domain/notes/note_failure.dart';
import '../../../presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

part 'note_form_bloc.freezed.dart';
part 'note_form_event.dart';
part 'note_form_state.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository _noteRepository;
  NoteFormBloc(this._noteRepository) : super(NoteFormState.initial()) {
    on<NoteFormEvent>((event, emit) async {
      await event.map(initialized: (value) async {
        value.initialNoteOption.fold(
            () => emit(state),
            (initialNote) => emit(state.copyWith(
                  note: initialNote,
                  isEditing: true,
                )));
      }, bodyChanged: (value) async {
        emit(state.copyWith(
            note: state.note.copyWith(body: NoteBody(value.bodyStr))));
      }, colorChanged: (value) async {
        emit(state.copyWith(
            note: state.note.copyWith(color: NoteColor(value.color))));
      }, todosChanged: (value) async {
        emit(state.copyWith(
            note: state.note.copyWith(
                todos: List3(
                    value.todos.map((primitive) => primitive.toDomain()))),
            saveFailureOrSuccessOption: none()));
      }, saved: (value) async {
        Either<NoteFailure, Unit>? failureOrSuccess;

        emit(
            state.copyWith(isSaving: true, saveFailureOrSuccessOption: none()));
        if (state.note.failureOption.isNone()) {
          failureOrSuccess = state.isEditing
              ? await _noteRepository.update(state.note)
              : await _noteRepository.create(state.note);
        }

        emit(state.copyWith(
            isSaving: false,
            saveFailureOrSuccessOption: optionOf(failureOrSuccess)));
      });
    });
  }
}
