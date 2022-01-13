import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/todo.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');
  late final Dio _dio;

  // observables
  final RxList<ToDo> _todos = List<ToDo>.empty(growable: true).obs;
  final _todoLoaded = false.obs;
  ////

  @override
  void onInit() async {
    super.onInit();
    _dio = Dio();

    retriveTodos();
  }

  List<ToDo> get todos => _todos;

  bool get todoLoaded => _todoLoaded.value;

  Future<void> retriveTodos() async {
    _todoLoaded.value = false;
    _dio
        .get(
      '${Constants.baseApiUrl}todos',
      options: Options(
        headers: {'Authorization': 'Bearer ${_authController.token}'},
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          value.data['data'].map(
            (value) {
              final ToDo _todo = ToDo.fromJson(value);
              _todos.add(_todo);
            },
          ).toList();
        } else {
          print(value.statusMessage);
        }
      },
    ).whenComplete(
      () => _todoLoaded.value = true,
    );
  }

  Future<void> updateTodo(ToDo todo) async {
    _todoLoaded.value = false;
    _dio
        .put(
      '${Constants.baseApiUrl}todos/' + todo.id,
      options: Options(
        headers: {'Authorization': 'Bearer ${_authController.token}'},
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          final ToDo _todo = ToDo.fromJson(value.data);
          _todos[_todos.indexWhere((element) => element.id == todo.id)] = _todo;
        } else {
          print(value.statusMessage);
        }
      },
    );
    _todoLoaded.value = true;
  }

  Future<void> storeTodo(String todo) async {
    _todoLoaded.value = false;
    _dio
        .post(
      '${Constants.baseApiUrl}todos',
      data: {
        'todo': todo,
      },
      options: Options(
        headers: {'Authorization': 'Bearer ${_authController.token}'},
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          final ToDo _todo = ToDo.fromJson(value.data);
          _todos.value = [_todo, ..._todos];
        } else {
          print(value.statusMessage);
        }
      },
    );
    _todoLoaded.value = true;
  }

  Future<void> deleteTodo(ToDo todo) async {
    _todoLoaded.value = false;
    _dio
        .delete(
      '${Constants.baseApiUrl}todos/' + todo.id,
      options: Options(
        headers: {'Authorization': 'Bearer ${_authController.token}'},
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          _todos.removeWhere(
            (element) => element.id == todo.id,
          );
        } else {
          print(value.statusMessage);
        }
      },
    );
    _todoLoaded.value = true;
  }
}
