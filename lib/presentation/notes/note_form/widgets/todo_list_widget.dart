import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kt_dart/collection.dart';
import 'package:note_app/domain/notes/value_objects.dart';
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
      child: Consumer<FormTodos>(
        builder: (context, formTodos, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: formTodos.value.size,
            itemBuilder: (context, index) {
              return TodoTile(
                index: index,
                key: ValueKey(context.formTodo[index].id),
              );
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
    final textEditingController = useTextEditingController(text: todo.name);

    return Slidable(
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            context.formTodos = context.formTodo.minusElement(todo);
            context
                .read<NoteFormBloc>()
                .add(NoteFormEvent.todosChanged(context.formTodo));
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListTile(
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
          title: TextFormField(
            controller: textEditingController,
            decoration: const InputDecoration(
                hintText: 'Todo', border: InputBorder.none, counterText: ''),
            maxLength: TodoName.maxLength,
            onChanged: (value) {
              context.formTodos = context.formTodo.map(
                (listTodo) =>
                    listTodo == todo ? todo.copyWith(name: value) : listTodo,
              );
            },
            validator: (_) {
              return context.read<NoteFormBloc>().state.note.todos.value.fold(
                  (f) => null,
                  (todoList) => todoList[index].name.value.fold(
                      (f) => f.maybeMap(
                            empty: (_) => 'Cannot be empty',
                            exceedingLength: (_) => 'Too long',
                            multiline: (_) => 'Has to be in a single line',
                            orElse: () => null,
                          ),
                      (_) => null));
            },
          ),
        ),
      ),
    );
  }
}
