import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project1/bloc/auth_bloc.dart';
import 'package:flutter_bloc_project1/cubit/todo_cubit.dart';
import 'package:flutter_bloc_project1/login_screen.dart';
import 'package:flutter_bloc_project1/todo_list.dart';
import 'add_todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => TodoCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const LoginScreen(),
          '/todo-list':(_)=> const TodoList(),
          '/add-todo': (_) => const AddTodoPage(),
        },

      ),
    );
  }
}
