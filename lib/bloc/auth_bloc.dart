import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      // TODO: implement event handler
      emit(AuthLoading());
      try{
        final email = event.email;
        final password = event.password;

        if(password.length < 6){
          return emit(AuthFailure('Password cannot be less than 6 charecters'));
        }

        await Future.delayed(const Duration(seconds: 1),(){
          return emit(AuthSuccess(uid:'$email-$password'));
        });
      }catch(e){
        return emit(AuthFailure(e.toString()));
      }
    });

    on<AuthLogoutRequested>((event,emit) async{
      emit(AuthLoading());
      try{
        await Future.delayed(Duration(seconds: 1),(){
          return emit(AuthInitial());
        });
      }catch(e){
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
