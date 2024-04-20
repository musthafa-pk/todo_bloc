import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project1/bloc/auth_bloc.dart';
import 'package:flutter_bloc_project1/todo_list.dart';
import 'package:flutter_bloc_project1/widgets/gradient_button.dart';
import 'package:flutter_bloc_project1/widgets/login_field.dart';
import 'package:flutter_bloc_project1/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    state.error
                ),),);
          }
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => TodoList()), (
                route) => false);
          }
        },
          builder: (context,state){
            if(state is AuthLoading){
              return Center(child: CircularProgressIndicator(),);
            }else{
              return  SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Image.asset('assets/images/signin_balls.png'),
                      const Text('Sign In', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50
                      ),),
                      const SizedBox(height: 50,),
                      const SocialButton(
                          iconPath: 'assets/svgs/g_logo.svg',
                          label: 'Continue with Google'
                      ),
                      const SizedBox(height: 20,),
                      const SocialButton(
                          iconPath: 'assets/svgs/f_logo.svg',
                          label: 'Continue with Facebook',
                          horizontalPadding: 90
                      ),
                      const SizedBox(height: 15),
                      const Text('or', style: TextStyle(fontSize: 17),),
                      const SizedBox(height: 15,),
                      LoginField(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(height: 15,),
                      LoginField(
                        hintText: 'Password',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20,),
                      GradientButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(AuthLoginRequested(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim()
                          ));
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
      ),
    );
  }
}
