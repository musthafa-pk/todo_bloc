import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project1/models/todo_model.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title){
    if(title.isEmpty){
      addError('Title canot be empty!');
    }
    final todo = Todo(
        name: title,
        createdAt: DateTime.now()
    );
    emit([...state,todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print('TodoCubit - $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print('TodoCubit - $error');
  }
}
