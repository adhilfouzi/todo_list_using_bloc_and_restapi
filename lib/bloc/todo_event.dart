// part of 'todo_bloc.dart';

// @immutable
// sealed class TodoEvent {}

// final class GetTodoEvent extends TodoEvent {}

// final class AddTodoEvent extends TodoEvent {
//   final Todo todo;
//   AddTodoEvent({required this.todo});
// }

// final class UpdateTodoEvent extends TodoEvent {}

// final class DelectTodoEvent extends TodoEvent {}

// final class PatchTodoEvent extends TodoEvent {}
part of 'todo_bloc.dart';

abstract class TodoEvent {}

class FetchTodoEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todo todo;

  AddTodoEvent(this.todo);
}

class UpdateTodoEvent extends TodoEvent {
  final Todo todo;

  UpdateTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodoEvent {
  final Todo todo;

  DeleteTodoEvent(this.todo);
}

class PatchTodoEvent extends TodoEvent {
  final Todo todo;

  PatchTodoEvent(this.todo);
}
