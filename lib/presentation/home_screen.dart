import 'package:flutter/material.dart';
import 'package:todo_application_using_bloc_and_rest_api/data/data_provider/data_provider.dart';
import 'package:todo_application_using_bloc_and_rest_api/data/model/todo_message_model.dart';
import 'package:todo_application_using_bloc_and_rest_api/data/repository/todo_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todoController = TodoDataProvider(TodoRepository());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Todo',
          style: TextStyle(
       
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
      body: FutureBuilder(
        future: todoController.fetchTodoList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          }
          return ListView.separated(
            itemCount: snapshot.data?.length ?? 0,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              var todo = snapshot.data?[index];
              return ListTile(
                leading: Checkbox(
                  value: todo!.completed!,
                  onChanged: (value) {
                    todoController.updatePatchCompleted(todo).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(milliseconds: 1000),
                          content: Text(value == 'true'
                              ? 'Todo patched successfully'
                              : 'Failed to patch todo'),
                        ),
                      );
                    });
                  },
                ),
                title: Text(
                  '${todo.title}',
                  style: TextStyle(
                    color: todo.completed! ? Colors.grey[700] : const Color.fromARGB(255, 10, 10, 10),
                    decoration: todo.completed!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.black54,
                    decorationThickness: 3.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.edit),
                        title: const Text('Edit'),
                        onTap: () {
                          Navigator.pop(context);
                          // Perform edit action here
                          todoController.updateputCompleted(todo).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(milliseconds: 1000),
                                content: Text(value == 'true'
                                    ? 'Put successful'
                                    : 'Failed to update todo'),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.delete),
                        title: const Text('Delete'),
                        onTap: () {
                          Navigator.pop(context);
                          // Perform delete action here
                          todoController.deleteTodo(todo).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(milliseconds: 1000),
                                content: Text(value == 'true'
                                    ? 'Todo deleted successfully'
                                    : 'Failed to delete todo'),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Todo todo = Todo(userId: 3, title: 'sample post', completed: false);
          todoController.postTodo(todo).then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
               backgroundColor: Colors.green,
             
                duration: const Duration(milliseconds: 1000),
                content: Text(value == 'true'
                    ? 'Todo added successfully'
                    : 'Failed to add todo'),
              ),
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
