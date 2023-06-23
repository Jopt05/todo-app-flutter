
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
    return Card(
      elevation: 0.5,
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
              child: Container(
                width: 300,
                child: Text(
                  todo,
                  style: TextStyle(
                    fontSize: 20.0,
                    decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
                    
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                onDelete(todo);
              }, 
              icon: const Icon( Icons.delete ),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}