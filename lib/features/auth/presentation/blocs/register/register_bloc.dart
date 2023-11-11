import 'dart:async';
import 'package:dawrni/core/enums/user_type.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:dawrni/features/auth/domain/parameters/register_parameters.dart';
import 'package:dawrni/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, BaseState<UserEntity>> {
  final AuthRepository authRepository;

  RegisterBloc(this.authRepository) : super(const BaseState<UserEntity>()) {
    on<RegisterButtonTappedEvent>(_register);
  }

  FutureOr<void> _register(RegisterButtonTappedEvent event, emit) async {
    emit(state.loading());
    final result = await authRepository.register(
      RegisterParameters(
          email: event.email,
          password: event.password,
          type: event.type),
    );
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
