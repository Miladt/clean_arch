import 'package:equatable/equatable.dart';

import 'package:clean_arch_2024/features/login/domain/entities/user_entity.dart';

abstract class LoginStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInit extends LoginStatus {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginStatus {
  @override
  List<Object?> get props => [];
}

class LoginErorr extends LoginStatus {
  final String message;
  LoginErorr(this.message);
  @override
  List<Object?> get props => [];
}

class LoginComplete extends LoginStatus {
  final UserEntity user;
  LoginComplete({
    required this.user,
  });
  @override
  List<Object?> get props => [];
}
