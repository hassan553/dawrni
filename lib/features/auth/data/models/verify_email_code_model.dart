import 'package:dawrni/features/auth/domain/entities/verify_email_code_entity.dart';

import '../../../../core/models/base_model.dart';

class VerifyEmailCodeModel extends BaseModel<VerifyEmailCodeEntity> {
  final String? message;
  VerifyEmailCodeModel({this.message});
  factory VerifyEmailCodeModel.fromJson(dynamic data) =>
      VerifyEmailCodeModel(message: data['message']);
  @override
  VerifyEmailCodeEntity toEntity() {
    return VerifyEmailCodeEntity(message: message ?? '');
  }
}
