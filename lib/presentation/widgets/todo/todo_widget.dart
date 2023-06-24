
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {

  final String todo;
  final ValueChanged<String> onDelete;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onEdit;
  bool completed;


  TodoWidget({
    super.key,
    required this.todo,
    this.completed = false,
    required this.onDelete,
    required this.onCompleted,
    required this.onEdit
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(seconds: 1),
      child: Card(
        elevation: 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: completed,
                    onChanged: (value) {
                      onCompleted(todo);
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      onDelete(todo);
                    }, 
                    icon: const Icon( Icons.delete ),
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onDoubleTap: () {
                  onEdit(todo);
                },
                child: Text(
                  todo,
                  style: TextStyle(
                    fontSize: 20.0,
                    decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}