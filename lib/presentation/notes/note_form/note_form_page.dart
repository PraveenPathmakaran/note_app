import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/application/note/note_form/note_form_bloc.dart';
import 'package:note_app/injection.dart';
import 'package:note_app/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:note_app/presentation/routes/router.dart';
import 'package:provider/provider.dart';

import '../../../domain/notes/note.dart';
import 'widgets/add_todo_tile_widget.dart';
import 'widgets/body_field_widget.dart';
import 'widgets/color_field_widget.dart';
import 'widgets/todo_list_widget.dart';

@RoutePage()
class NoteFormPage extends StatelessWidget {
  final Note? editNote;
  const NoteFormPage({super.key, required this.editNote});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.call<NoteFormBloc>()
        ..add(NoteFormEvent.initialized(optionOf(editNote))),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
        listenWhen: (p, c) =>
            p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                  (failure) => FlushbarHelper.createError(
                      message: failure.map(
                          unexpected: (_) =>
                              'Unexpected error occured, please contact support.',
                          insufficientPermission: (_) =>
                              'Insufficient permissions ❌',
                          unableToUpdate: (_) =>
                              "Couldn't update the note. Was it deleted from another device?")).show(
                      context),
                  (_) => {
                        context.router.popUntil((route) =>
                            route.settings.name == NotesOverViewRoute.name)
                      }));
        },
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              const NoteFormPageScaffold(),
              SavingInProgressOverlay(isSaving: state.isSaving)
            ],
          );
        },
      ),
    );
  }
}

class NoteFormPageScaffold extends StatelessWidget {
  const NoteFormPageScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (p, c) => p.isEditing != c.isEditing,
          builder: (context, state) {
            return Text(state.isEditing ? 'Edit a note' : 'Create a note');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              context.read<NoteFormBloc>().add(const NoteFormEvent.saved());
            },
          )
        ],
      ),
      body: BlocBuilder<NoteFormBloc, NoteFormState>(
        buildWhen: (p, c) => p.showErrorMessages != c.showErrorMessages,
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => FormTodos(),
            child: Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    BodyField(),
                    ColorField(),
                    TodoList(),
                    AddTodoTile(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;

  const SavingInProgressOverlay({
    super.key,
    required this.isSaving,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(
                'Saving',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
