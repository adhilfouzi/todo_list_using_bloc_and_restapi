import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application_using_bloc_and_rest_api/data/data_provider/data_provider.dart';
import 'package:todo_application_using_bloc_and_rest_api/data/model/todo_message_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoDataProvider provider;

  TodoBloc(this.provider) : super(TodoInitial()) {
    on<FetchTodoEvent>(_onFetchTodoEvent);
    on<AddTodoEvent>(_onAddTodoEvent);
    on<UpdateTodoEvent>(_onUpdateTodoEvent);
    on<DeleteTodoEvent>(_onDeleteTodoEvent);
    on<PatchTodoEvent>(_onPatchTodoEvent);
  }

  void _onFetchTodoEvent(FetchTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());
    try {
      final todoList = await provider.fetchTodoList();
      emit(TodoLoadedState(todo: todoList));
    } catch (e) {
      log('Error: $e');
      emit(TodoLoadingErrorState(e.toString()));
    }
  }

  void _onAddTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodoAddingState());
    try {
      final response = await provider.postTodo(event.todo);
      if (response == 'true') {
        final todoList = await provider.fetchTodoList();
        emit(TodoLoadedState(todo: todoList));
      } else {
        emit(TodoAddingErrorState('Failed to add todo'));
      }
    } catch (e) {
      log('Error: $e');
      emit(TodoAddingErrorState(e.toString()));
    }
  }

  void _onUpdateTodoEvent(
      UpdateTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodoEditingState());
    try {
      final response = await provider.updateputCompleted(event.todo);
      if (response == 'true') {
        final todoList = await provider.fetchTodoList();
        emit(TodoLoadedState(todo: todoList));
      } else {
        emit(TodoEditingErrorState('Failed to update todo'));
      }
    } catch (e) {
      log('Error: $e');
      emit(TodoEditingErrorState(e.toString()));
    }
  }

  void _onDeleteTodoEvent(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodoDeletingState());
    try {
      final response = await provider.deleteTodo(event.todo);
      if (response == 'true') {
        final todoList = await provider.fetchTodoList();
        emit(TodoLoadedState(todo: todoList));
      } else {
        emit(TodoDeletingErrorState('Failed to delete todo'));
      }
    } catch (e) {
      log('Error: $e');
      emit(TodoDeletingErrorState(e.toString()));
    }
  }

  void _onPatchTodoEvent(PatchTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodoPatchingState());
    try {
      final response = await provider.updatePatchCompleted(event.todo);
      emit(TodoPatchedState(sms: response));
    } catch (e) {
      log('Error: $e');
      emit(TodoPatchingError(e.toString()));
    }
  }
}
