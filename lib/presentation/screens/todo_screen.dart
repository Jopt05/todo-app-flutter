

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter_todo_app/presentation/widgets/todo/todo_widget.dart';
import 'package:flutter_todo_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon( Icons.menu ),
        ),
        title: const Text('Todo App'),
        backgroundColor: Colors.grey[400],
      ),
      body: const _TodoView(),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final todoProvider = context.watch<TodoProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todoProvider.todos.length,
                itemBuilder: (context, index) {
                  final newTodo = todoProvider.todos[index];
                  return TodoWidget(
                    todo: newTodo.todo,
                    onDelete: (value) {
                      todoProvider.deleteTodo(
                        value
                      );
                    },
                    onCompleted: (value) {
                      todoProvider.completeTodo(
                        value
                      );
                    },
                    completed: newTodo.completed,
                  );
                },
              ),
            ),
            MessageFieldBox(
              onValue: (value) {
                todoProvider.sendTodo(
                  value
                );
              },
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}