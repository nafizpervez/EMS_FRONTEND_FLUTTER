import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:adnems/app/modules/todo/local_widgets/todo_list.dart';
import 'package:flutter/material.dart';
import 'local_widgets/profile_edit.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      subScreen: ResponsiveUI(
        desktop: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: const [
              Expanded(
                flex: 4,
                child: ProfileEdit(),
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
        ),
        tablet: const Padding(
          padding: EdgeInsets.all(8.0),
          child: ProfileEdit(),
        ),
      ),
    );
  }
}
