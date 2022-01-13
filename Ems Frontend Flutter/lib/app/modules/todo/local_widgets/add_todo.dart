import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/modules/todo/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddToDo extends StatelessWidget {
  final TodoController controller;
  const AddToDo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> _addTodoFormKey =
        GlobalKey<FormBuilderState>(debugLabel: 'AddTodoForm');
    return FormBuilder(
      key: _addTodoFormKey,
      child: FormBuilderTextField(
        name: 'todo',
        decoration: inputStyle(
          'Add Todo...',
          const Icon(Icons.add),
          null,
        ),
        onSubmitted: (value) {
          if (value != null) {
            controller.storeTodo(value);
            _addTodoFormKey.currentState!.reset();
          }
        },
      ),
    );
  }
}
