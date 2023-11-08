part of 'verify_email_bloc.dart';

sealed class VerifyEmailEvent extends Equatable {
  const VerifyEmailEvent();

  @override
  List<Object> get props => [];
}

class VerifyEmailButtonTappedEvent extends VerifyEmailEvent {
  final String email;
  final String code;

  const VerifyEmailButtonTappedEvent({
    required this.email,
    required this.code,
  });

  @override
  List<Object> get props => [email, code];
}
