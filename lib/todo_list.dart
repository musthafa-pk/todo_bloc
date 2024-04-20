import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project1/bloc/auth_bloc.dart';
import 'package:flutter_bloc_project1/cubit/todo_cubit.dart';
import 'package:flutter_bloc_project1/login_screen.dart';
import 'package:flutter_bloc_project1/models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context
        .watch<AuthBloc>()
        .state as AuthSuccess;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(onPressed: () {
            context.read<AuthBloc>().add(AuthLogoutRequested());
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthInitial){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
          }
        },
        builder: (context, state) {
          if(state is AuthLoading){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is AuthSuccess){
            return Container(
              child: BlocBuilder<TodoCubit, List<Todo>>(
                builder: (context, todos) {
                  return ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        return ListTile(
                          title: Text(todo.name),
                        );
                      });
                },
              ),
            );
          }else{
            return Container();
          }

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
