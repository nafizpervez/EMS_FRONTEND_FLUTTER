import 'dart:convert';

ToDo toDoFromJson(String str) => ToDo.fromJson(json.decode(str));

String toDoToJson(ToDo data) => json.encode(data.toJson());

class ToDo {
  ToDo({
    required this.id,
    required this.todo,
    required this.status,
  });

  final String id;
  final String todo;
  final String status;

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        id: json["id"],
        todo: json["todo"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "status": status,
      };

  bool isDone() {
    if (status == 'pending') {
      return false;
    } else {
      return true;
    }
  }
}
