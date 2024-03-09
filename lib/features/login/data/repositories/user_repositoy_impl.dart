import 'package:clean_arch_2024/features/login/data/datasources/user_datasource.dart';
import 'package:clean_arch_2024/features/login/domain/entities/user_entity.dart';
import 'package:clean_arch_2024/features/login/domain/repositories/user_repository.dart';
import 'package:clean_arch_2024/features/login/domain/usecases/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final IUserDatasource _datasource;
  UserRepositoryImpl(this._datasource);
  @override
  Future<Either<String, UserEntity>> login({required String phoneNumber, required String password}) async {
    try {
      final response = await _datasource.login(phoneNumber: phoneNumber, password: password);
      return right(response);
    } catch (e) {
      return left('خطا');
    }
  }
}
