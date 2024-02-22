import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_application_using_bloc_and_rest_api/data/model/todo_message_model.dart';
import 'package:todo_application_using_bloc_and_rest_api/data/repository/repository.dart';

class TodoRepository implements Repository {
  String dataURL = 'https://jsonplaceholder.typicode.com';
  @override
  Future<String> deleteTodo(Todo todo) async {
    var result = 'false';
    await http.delete(Uri.parse('$dataURL/todos/${todo.id}')).then((value) {
      print(value.body);
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List<Todo>> getTodoList() async {
    List<Todo> todoList = [];
    var response = await http.get(Uri.parse('$dataURL/todos'));
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body);
    for (var i = 0; i < body.length; i++) {
      todoList.add(Todo.fromJson(body[i]));
    }
    return todoList;
  }

  @override
  Future<String> patchCompleted(Todo todo) async {
    String resData = '';
    await http.patch(
      Uri.parse('$dataURL/todos/${todo.id}'),
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);

      return resData = result['completed'];
    });
    return resData;
  }

  @override
  Future<String> putCompleted(Todo todo) async {
    String resData = '';
    await http.put(
      Uri.parse('$dataURL/todos/${todo.id}'),
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);

      return resData = result['completed'];
    });
    return resData;
  }

  @override
  Future<String> postTodo(Todo todo) async {
    print('${todo.toJson()}');
    var response =
        await http.post(Uri.parse('$dataURL/todos/'), body: todo.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }
}
