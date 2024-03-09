import 'package:clean_arch_2024/features/login/presentation/manager/status/login_status.dart';

class LoginState {
  final LoginStatus loginStatus;

  const LoginState({required this.loginStatus});

  LoginState copyWith({LoginStatus? newloginStatus}) {
    return LoginState(loginStatus: newloginStatus ?? loginStatus);
  }
}
