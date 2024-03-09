import 'package:clean_arch_2024/core/util/dio_provider.dart';
import 'package:clean_arch_2024/features/login/data/datasources/user_datasource.dart';
import 'package:clean_arch_2024/features/login/data/repositories/user_repositoy_impl.dart';
import 'package:clean_arch_2024/features/login/domain/repositories/user_repository.dart';
import 'package:clean_arch_2024/features/login/domain/usecases/user_repository.dart';
import 'package:clean_arch_2024/features/login/presentation/manager/login_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;

Future<void> getItInit() async {
  GetIt.I.registerSingleton<Dio>(DioProvider().createDio());

  //Datasources
  GetIt.I.registerSingleton<IUserDatasource>(UserRemoteDatasource(locator.get()));

  //Repositories
  GetIt.I.registerSingleton<UserRepository>(UserRepositoryImpl(locator.get()));

  //Use Cases
  GetIt.I.registerSingleton<LoginUseCase>(LoginUseCase(locator.get()));

  //Blocs
  GetIt.I.registerSingleton<LoginBloc>(LoginBloc(locator.get()));
}
