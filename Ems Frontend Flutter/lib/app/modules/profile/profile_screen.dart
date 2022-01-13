import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:adnems/app/modules/todo/local_widgets/todo_list.dart';
import 'package:flutter/material.dart';
import 'local_widgets/profile_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      subScreen: Container(
        padding: const EdgeInsets.all(15.0),
        child: ResponsiveUI(
          desktop: Row(
            children: const [
              Expanded(
                flex: 4,
                child: ProfileMain(),
              ),
              SizedBox(
                width: 30.0,
              ),
              Expanded(
                flex: 1,
                child: ToDoList(),
              ),
            ],
          ),
          tablet: const ProfileMain(),
        ),
      ),
    );
  }
}
