import 'dart:async';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:dawrni/features/auth/domain/parameters/login_user_parameters.dart';
import 'package:dawrni/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, BaseState<UserEntity>> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(const BaseState<UserEntity>()) {
    on<LoginButtonTappedEvent>(_login);
  }

  FutureOr<void> _login(LoginButtonTappedEvent event, emit) async {
    emit(state.loading());
    final result = await authRepository.login(
      LoginUserParameters(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
