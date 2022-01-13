import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/todo.dart';
import 'package:adnems/app/modules/todo/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_todo.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController todoScroll =
        ScrollController(debugLabel: 'todoScroll');
    return Card(
      elevation: 2,
      shadowColor: ADNColorConstants.kADNGray,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: GetX<TodoController>(builder: (todoController) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TO DO',
                style: TextStyle(
                  color: ADNColorConstants.kADNBlack,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: !todoController.todoLoaded
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: ADNColorConstants.kADNLightGreen,
                        ),
                      )
                    : todoController.todos.isEmpty
                        ? const Center(
                            child: Text(
                              'Add a todo...',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          )
                        : ListView(
                            controller: todoScroll,
                            children: todoController.todos
                                .map(
                                  (todo) => ToDoItem(
                                    todo: todo,
                                    controller: todoController,
                                  ),
                                )
                                .toList(),
                          ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AddToDo(
                controller: todoController,
              ),
            ],
          ),
        );
      }),
    );
  }
}

class ToDoItem extends StatefulWidget {
  final ToDo todo;
  final TodoController controller;
  const ToDoItem({
    Key? key,
    required this.todo,
    required this.controller,
  }) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: widget.todo.isDone()
                ? const Icon(
                    Icons.done_all,
                    color: ADNColorConstants.kADNLightGreen,
                  )
                : const Icon(
                    Icons.pending_outlined,
                    color: ADNColorConstants.kADNGray,
                  ),
            onPressed: () {
              widget.controller.updateTodo(widget.todo);
            },
          ),
          Expanded(
            child: Text(
              widget.todo.todo,
              maxLines: 3,
              style: const TextStyle(overflow: TextOverflow.fade),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () {
              widget.controller.deleteTodo(widget.todo);
            },
          ),
        ],
      ),
    );
  }
}
