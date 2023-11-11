import 'package:dawrni/core/entities/base_entity.dart';

class VerifyEmailCodeEntity extends BaseEntity {
  final String message;
  VerifyEmailCodeEntity({required this.message});
  
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
