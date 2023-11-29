import 'package:equatable/equatable.dart';

class GetClientAppointmentsParameters extends Equatable {
  final int? offset;
  final int? limit;

  const GetClientAppointmentsParameters({this.offset = 0, this.limit = 10});

  Map<String, dynamic> toJson() => {};

  String toQueryParameters() => "?limit=$limit&offset=$offset";

  @override
  List<Object?> get props => [offset, limit];
}
