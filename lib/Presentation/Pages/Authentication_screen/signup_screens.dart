import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/Authenticatio_bloc/auth_bloc.dart';
import '../../Bloc/Authenticatio_bloc/auth_event.dart';
import '../../Bloc/Authenticatio_bloc/auth_state.dart';
import '../../Widgets/my_signin_button.dart';
import '../../Widgets/my_text_field.dart';
import '../../Widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: loader,
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.grey[300],
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),

                      // logo
                      const Icon(
                        Icons.key,
                        size: 100,
                      ),

                      const SizedBox(height: 50),

                      Text(
                        'Welcome back you\'ve been missed!',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 25),

                      /// email textfield
                      MyTextField(
                        controller: _emailController,
                        hintText: 'test@gmail.com',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      ///  password textfield
                      MyTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 25),

                      // sign in button
                      MyButton(
                        onTap: () {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          BlocProvider.of<AuthBloc>(context).add(
                            SignUpEvent(email, password),
                          );
                        },
                      ),

                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
