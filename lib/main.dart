import 'package:clean_arch_2024/core/di/di.dart';
import 'package:clean_arch_2024/features/login/presentation/manager/login_bloc.dart';
import 'package:clean_arch_2024/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<LoginBloc>(
        create: (context) => locator.get<LoginBloc>(),
        child: LoginPage(),
      ),
    );
  }
}
