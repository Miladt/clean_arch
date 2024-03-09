import 'package:clean_arch_2024/features/login/data/models/user_model.dart';
import 'package:clean_arch_2024/features/login/domain/entities/user_entity.dart';
import 'package:dio/dio.dart';

abstract class IUserDatasource {
  Future<UserEntity> login({required String phoneNumber, required String password});
}

class UserRemoteDatasource extends IUserDatasource {
  final Dio _dio;
  UserRemoteDatasource(this._dio);
  @override
  Future<UserEntity> login({required String phoneNumber, required String password}) async {
    try {
      final response = await _dio.post('users/login', data: {'phoneNumber': phoneNumber, 'password': password});
      return UserModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
