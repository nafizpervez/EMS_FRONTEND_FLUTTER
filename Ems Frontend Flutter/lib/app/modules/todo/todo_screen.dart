import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:adnems/app/modules/todo/local_widgets/todo_list.dart';
import 'package:flutter/material.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      subScreen: Container(
        padding: const EdgeInsets.all(15.0),
        child: const ToDoList(),
      ),
    );
  }
}
