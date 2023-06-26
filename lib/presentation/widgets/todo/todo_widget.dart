
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
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: completed,
                onChanged: (value) {
                  onCompleted(todo);
                },
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
              FilledButton(
                onPressed: () {
                  onDelete(todo);
                }, 
                child: const Icon( Icons.delete ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}