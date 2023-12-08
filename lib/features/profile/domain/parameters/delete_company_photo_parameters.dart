import 'package:equatable/equatable.dart';

class DeleteCompanyPhotoParameters extends Equatable {
  final int id;

  const DeleteCompanyPhotoParameters(
      {
        required this.id,
      });

  Future<Map<String, dynamic>> toJson() async => {};

  String toQueryParameters() => "$id";

  @override
  List<Object?> get props => [id];
}