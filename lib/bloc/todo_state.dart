part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
final class TodoLoadingState extends TodoState {}

final class TodoLoadedState extends TodoState {
  final List<Todo> todo;
  TodoLoadedState({required this.todo});
}

final class TodoLoadingErrorState extends TodoState {
  final String errorMessage;
  TodoLoadingErrorState(this.errorMessage);
}

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

final class TodoAddingState extends TodoState {}

final class TodoAddedState extends TodoState {
  final int message;
  TodoAddedState({required this.message});
}

final class TodoAddingErrorState extends TodoState {
  final String errorMessage;
  TodoAddingErrorState(this.errorMessage);
}

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
final class TodoEditingState extends TodoState {}

final class TodoEditedState extends TodoState {}

final class TodoEditingErrorState extends TodoState {
  final String errorMessage;
  TodoEditingErrorState(this.errorMessage);
}

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
final class TodoDeletingState extends TodoState {}

final class TodoDeletedState extends TodoState {}

final class TodoDeletingErrorState extends TodoState {
  final String errorMessage;
  TodoDeletingErrorState(this.errorMessage);
}

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
final class TodoPatchingState extends TodoState {}

final class TodoPatchedState extends TodoState {
  final String sms;
  TodoPatchedState({required this.sms});
}

final class TodoPatchingError extends TodoState {
  final String errorMessage;
  TodoPatchingError(this.errorMessage);
}
