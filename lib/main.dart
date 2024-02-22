import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application_using_bloc_and_rest_api/bloc/todo_bloc.dart';
import 'package:todo_application_using_bloc_and_rest_api/data/data_provider/data_provider.dart';
import 'package:todo_application_using_bloc_and_rest_api/data/repository/todo_repository.dart';
import 'package:todo_application_using_bloc_and_rest_api/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TodoRepository(),
      child: BlocProvider(
        create: (context) => TodoBloc(context.read<TodoDataProvider>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
