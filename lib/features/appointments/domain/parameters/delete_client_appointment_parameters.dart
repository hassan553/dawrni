import 'package:equatable/equatable.dart';

class DeleteClientAppointmentParameters extends Equatable {
  final int id;

  const DeleteClientAppointmentParameters({required this.id});

  Map<String, dynamic> toJson() => {};

  String toQueryParameters() => "$id";

  @override
  List<Object?> get props => [id];
}
