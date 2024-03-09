import 'package:clean_arch_2024/core/usecase/usecase.dart';
import 'package:clean_arch_2024/features/login/data/datasources/user_datasource.dart';
import 'package:clean_arch_2024/features/login/domain/repositories/user_repository.dart';
import 'package:clean_arch_2024/features/login/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends UseCase<Either<String, UserEntity>, Map<String, String>> {
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository);

  @override
  Future<Either<String, UserEntity>> call({Map<String, String>? params}) {
    return _userRepository.login(phoneNumber: params!['phoneNumber']!, password: params['password']!);
  }
}
