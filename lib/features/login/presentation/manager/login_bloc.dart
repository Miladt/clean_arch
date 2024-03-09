import 'package:clean_arch_2024/features/login/domain/repositories/user_repository.dart';
import 'package:clean_arch_2024/features/login/domain/usecases/user_repository.dart';
import 'package:clean_arch_2024/features/login/presentation/manager/login_event.dart';
import 'package:clean_arch_2024/features/login/presentation/manager/login_state.dart';
import 'package:clean_arch_2024/features/login/presentation/manager/status/login_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(LoginState(loginStatus: LoginInit())) {
    on<Login>((event, emit) async {
      emit(state.copyWith(newloginStatus: LoginLoading()));
      final response = await _loginUseCase.call(params: {'phoneNumber': event.phoneNumber, 'password': event.password});
      response.fold((l) {
        emit(state.copyWith(newloginStatus: LoginErorr(l)));
      }, (r) {
        emit(state.copyWith(newloginStatus: LoginComplete(user: r)));
      });
    });
  }
}
