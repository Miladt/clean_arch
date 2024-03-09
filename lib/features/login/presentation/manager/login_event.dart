// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class LoginEvent {}

class Login extends LoginEvent {
  String phoneNumber;
  String password;
  Login({
    required this.phoneNumber,
    required this.password,
  });
}
