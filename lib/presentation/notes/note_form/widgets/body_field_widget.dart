import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_app/application/note/note_form/note_form_bloc.dart';
import 'package:note_app/domain/notes/value_objects.dart';

class BodyField extends HookWidget {
  const BodyField({super.key});

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textEditingController.text = state.note.body.getOrCrash();
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(labelText: 'Note', counterText: ''),
          maxLength: NoteBody.maxLength,
          maxLines: null,
          minLines: 5,
          onChanged: (value) {
            context.read<NoteFormBloc>().add(NoteFormEvent.bodyChanged(value));
          },
          validator: (_) {
            context.read<NoteFormBloc>().state.note.body.value.fold(
                (l) => l.maybeMap(
                      empty: (f) => 'Cannot be empty',
                      exceedingLength: (f) => 'Exceeding length, max: ${f.max}',
                      orElse: () => null,
                    ),
                (r) => null);

            return null;
          },
        ),
      ),
    );
  }
}
