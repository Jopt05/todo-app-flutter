
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/domain/entities/todo.dart';

class TodoProvider extends ChangeNotifier {

  List<TodoPost> todos = [];

  // final ScrollController chatScrollController = ScrollController();

  void sendTodo( String text ) {

      if ( text.isEmpty ) return;

      final newMessage = TodoPost(
        todo: text,
        completed: false
      );

      todos.add(
        newMessage
      );

      // Actualiza el provider, notifica a todos los eque escuchen
      notifyListeners();
      // moveScrollToBottom();

  }

  void deleteTodo( String text ) {

    todos.removeWhere((element) => element.todo == text);

    notifyListeners();

  }

  void completeTodo( String text ) {

    Iterable<TodoPost> newTodo = todos.where((element) => element.todo == text);
    print(newTodo.first);
    newTodo = newTodo.toList();
    TodoPost todo = newTodo.first;
    print(todo.todo);
    print(todo.completed);

    todo.completed = !todo.completed;

    print(todo.completed);

    notifyListeners();

  }

  // void moveScrollToBottom() {

  //   chatScrollController.animateTo(
  //     // Ve hasta el máximo que puedas 
  //     chatScrollController.position.maxScrollExtent, 
  //     duration: const Duration( milliseconds: 300 ), 
  //     curve: Curves.easeOut
  //   );

  // }

}