part of 'todo_bloc.dart';

sealed class TodoEvent {}

final class FetchTodoEvent extends TodoEvent {}

final class AddTodoEvent extends TodoEvent {
  final Todo todo;

  AddTodoEvent(this.todo);
}

final class UpdateTodoEvent extends TodoEvent {
  final Todo todo;

  UpdateTodoEvent(this.todo);
}

final class DeleteTodoEvent extends TodoEvent {
  final Todo todo;

  DeleteTodoEvent(this.todo);
}

final class PatchTodoEvent extends TodoEvent {
  final Todo todo;

  PatchTodoEvent(this.todo);
}
