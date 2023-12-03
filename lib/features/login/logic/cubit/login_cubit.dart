import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/login/data/repo/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart';

import '../../data/models/login_request_body.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _homeRepo;

  LoginCubit(this._homeRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _homeRepo.login(loginRequestBody);
    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.failure.message ?? ''));
      },
    );
  }
}
