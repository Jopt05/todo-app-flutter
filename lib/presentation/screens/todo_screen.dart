
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter_todo_app/presentation/widgets/shared/search_field_box.dart';
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

  final textController = TextEditingController();

  bool isEditing = false;
  String todoToModify = "";
  String actualSearch = "";

  @override
  Widget build(BuildContext context) {

    final todoProvider = context.watch<TodoProvider>();

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),

              SearchFieldBox(
                onValue: (value) {
                  setState(() {
                    actualSearch = value;
                  });
                },
                currentFilter: actualSearch,
              ),

              const SizedBox(
                height: 50,
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'All ToDos',
                    style: TextStyle(
                      fontSize: 30
                    ),
                  ),
                ],
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: todoProvider.todos.length,
                  itemBuilder: (context, index) {
                    final newTodo = todoProvider.todos[index];
                    if( actualSearch.isEmpty ) {
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
                          setState(() {
                            isEditing = true;
                            todoToModify = value;
                          });
                          textController.text = value;
                        },
                      );
                    }

                    if( actualSearch.isNotEmpty && newTodo.todo.toLowerCase().contains(actualSearch.toLowerCase()) ) {
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
                          setState(() {
                            isEditing = true;
                            todoToModify = value;
                          });
                          textController.text = value;
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
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
      ),
    );
  }
}