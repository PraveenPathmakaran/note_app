import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kt_dart/collection.dart';
import 'package:note_app/presentation/notes/note_form/misc/build_context_x.dart';
import 'package:provider/provider.dart';

import '../../../../application/note/note_form/note_form_bloc.dart';
import '../misc/todo_item_presentation_classes.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (p, c) => p.note.todos.isFull != c.note.todos.isFull,
      listener: (context, state) {
        if (state.note.todos.isFull) {
          FlushbarHelper.createAction(
            message: 'Want longer lists? Activate premium 🤩',
            button: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'BUY NOW',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
            duration: const Duration(seconds: 5),
          ).show(context);
        }
      },
      child: Consumer(
        builder: (context, formTodos, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return TodoTile(index: index);
            },
          );
        },
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;

  const TodoTile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final todo =
        context.formTodo.getOrElse(index, (_) => TodoItemPrimitive.empty());

    return ListTile(
      leading: Checkbox(
        value: todo.done,
        onChanged: (value) {
          if (value != null) {
            context.formTodos = context.formTodo.map(
              (listTodo) =>
                  listTodo == todo ? todo.copyWith(done: value) : listTodo,
            );
          }

          context
              .read<NoteFormBloc>()
              .add(NoteFormEvent.todosChanged(context.formTodo));
        },
      ),
    );
  }
}
