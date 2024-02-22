import 'package:todo_application_using_bloc_and_rest_api/data/model/todo_message_model.dart';

abstract class Repository {
  //get
  Future<List<Todo>> getTodoList();
  //patch
  Future<String> patchCompleted(Todo todo);
  //put
  Future<String> putCompleted(Todo todo);
  //delete
  Future<String> deleteTodo(Todo todo);
  //post
  Future<String> postTodo(Todo todo);
}
