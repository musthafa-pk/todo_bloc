import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project1/cubit/todo_cubit.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController todoTitleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: todoTitleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  context.read<TodoCubit>().addTodo(todoTitleController.text.trim());
                  Navigator.pop(context);
                },
                child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
