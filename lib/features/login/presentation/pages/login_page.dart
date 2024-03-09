import 'package:clean_arch_2024/features/login/presentation/manager/login_bloc.dart';
import 'package:clean_arch_2024/features/login/presentation/manager/login_event.dart';
import 'package:clean_arch_2024/features/login/presentation/manager/login_state.dart';
import 'package:clean_arch_2024/features/login/presentation/manager/status/login_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 12),
            BlocConsumer<LoginBloc, LoginState>(buildWhen: (previous, current) {
              if (current.loginStatus is LoginLoading) {
                return true;
              }
              return false;
            }, listener: (context, state) {
              if (state.loginStatus is LoginComplete) {}
              if (state.loginStatus is LoginErorr) {
                final loginError = state.loginStatus as LoginErorr;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loginError.message)));
              }
            }, builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  context
                      .read<LoginBloc>()
                      .add(Login(phoneNumber: _phoneNumberController.text, password: _passwordController.text));
                },
                child: const Text('Login'),
              );
            })
          ],
        ),
      ),
    );
  }
}
