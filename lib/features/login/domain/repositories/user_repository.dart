import 'package:clean_arch_2024/features/login/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<String, UserEntity>> login({required String phoneNumber, required String password});
}
