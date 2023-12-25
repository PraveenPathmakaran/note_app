import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:note_app/application/note/note_form/note_form_bloc.dart';
import 'package:note_app/presentation/notes/note_form/misc/build_context_x.dart';
import 'package:note_app/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

class AddTodoTile extends StatelessWidget {
  const AddTodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormBloc, NoteFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        context.formTodos = state.note.todos.value.fold(
          (l) => listOf<TodoItemPrimitive>(),
          (todoItemList) =>
              todoItemList.map((_) => TodoItemPrimitive.fromDomain(_)),
        );
      },
      buildWhen: (p, c) => p.note.todos.isFull != c.note.todos.isFull,
      builder: (context, state) {
        return ListTile(
          enabled: !state.note.todos.isFull,
          title: const Text('Add a todo'),
          leading: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.add),
          ),
          onTap: () {
            context.formTodos =
                context.formTodo.plusElement(TodoItemPrimitive.empty());
            context
                .read<NoteFormBloc>()
                .add(NoteFormEvent.todosChanged(context.formTodo));
          },
        );
      },
    );
  }
}
