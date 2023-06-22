import 'package:flutter/material.dart';
import 'package:flutter_todo_app/config/theme/app_theme.dart';
import 'package:flutter_todo_app/presentation/screens/todo_screen.dart';
import 'package:flutter_todo_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Todo App',
        theme: AppTheme(selectedColor: 0).theme(),
        home: Scaffold(
          body: TodoScreen()
        ),
      ),
    );
  }
}
