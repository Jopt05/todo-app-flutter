
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

    TodoPost todo = _findTodo(text);

    todo.completed = !todo.completed;

    notifyListeners();

  }

  void editTodo( String text, String newText ) {

    TodoPost todo = _findTodo(text);

    todo.todo = newText;

    notifyListeners();

  }

  TodoPost _findTodo( String text ) {

    Iterable<TodoPost> newTodo = todos.where((element) => element.todo == text);
    newTodo = newTodo.toList();
    TodoPost todo = newTodo.first;

    return todo;

  }

}