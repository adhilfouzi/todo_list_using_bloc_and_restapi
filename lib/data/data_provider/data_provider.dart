import 'package:todo_application_using_bloc_and_rest_api/data/model/todo_message_model.dart';
import 'package:todo_application_using_bloc_and_rest_api/data/repository/repository.dart';

class TodoDataProvider {
  final Repository _repository;

  TodoDataProvider(this._repository);

  //get
  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }

  Future<String> updatePatchCompleted(Todo todo) async {
    return _repository.patchCompleted(todo);
  }

  Future<String> updateputCompleted(Todo todo) async {
    return _repository.putCompleted(todo);
  }

  Future<String> deleteTodo(Todo todo) {
    return _repository.deleteTodo(todo);
  }

  Future<String> postTodo(Todo todo) {
    return _repository.postTodo(todo);
  }
}
