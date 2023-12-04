import 'package:equatable/equatable.dart';

class GetCompanyAppointmentsParameters extends Equatable {
  final int? offset;
  final int? limit;
  final int? status;

  const GetCompanyAppointmentsParameters({this.offset = 0, this.limit = 10, this.status});

  Map<String, dynamic> toJson() => {};

  String toQueryParameters() => "?limit=$limit&offset=$offset${status == null ? '' : '&status=$status'}";

  @override
  List<Object?> get props => [offset, limit, status];
}
