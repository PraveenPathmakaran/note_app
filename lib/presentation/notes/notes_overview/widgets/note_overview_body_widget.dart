import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/note/note_watcher/note_watcher_bloc.dart';

class NoteOverViewBody extends StatelessWidget {
  const NoteOverViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
            loadSuccess: (state) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final note = state.notes[index];
                  if (note.failureOption.isSome()) {
                    return null;
                  } else {
                    return null;
                  }
                },
                itemCount: state.notes.size,
              );
            },
            loadFailure: (_) => Container());
      },
    );
  }
}
