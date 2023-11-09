import 'dart:async';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/auth/domain/entities/verify_email_code_entity.dart';
import 'package:dawrni/features/auth/domain/parameters/verify_email_code_parameters.dart';
import 'package:dawrni/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'verify_email_event.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, BaseState<VerifyEmailCodeEntity>> {
  final AuthRepository authRepository;

  VerifyEmailBloc(this.authRepository) : super(const BaseState()) {
    on<VerifyEmailButtonTappedEvent>(_verifyEmail);
  }

  FutureOr<void> _verifyEmail(VerifyEmailButtonTappedEvent event, emit) async {
    emit(state.loading());
    final result = await authRepository.verifyEmailCode(
      VerifyEmailCodeParameters(
        email: event.email,
        code: event.code,
      ),
    );
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
