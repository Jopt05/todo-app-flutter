

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter_todo_app/presentation/widgets/todo/todo_widget.dart';
import 'package:flutter_todo_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon( Icons.menu ),
        ),
        title: const Text('Todo App'),
        backgroundColor: colors.background,
      ),
      body: _TodoView(),
    );
  }
}

class _TodoView extends StatefulWidget {


  @override
  State<_TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<_TodoView> {
  @override
  Widget build(BuildContext context) {

    final todoProvider = context.watch<TodoProvider>();
    final textController = TextEditingController();

    bool isEditing = false;
    String todoToModify = '';

    void _sendEdit(String text) {
      
      isEditing = true;
      todoToModify = text;
      textController.text = todoToModify;

    }

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
                    onEdit: (value) {
                      _sendEdit(value);
                    },
                  );
                },
              ),
            ),
            MessageFieldBox(
              onValue: (value) {
                if ( !isEditing ) {
                  todoProvider.sendTodo(
                    value
                  );
                } else {
                  todoProvider.editTodo(
                    todoToModify,
                    value
                  );
                }
              },
              isEditing: isEditing,
              textController: textController,
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