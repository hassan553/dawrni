import 'package:equatable/equatable.dart';

class MapPointEntity extends Equatable {
  final num long;
  final num lat;

  const MapPointEntity({required this.long, required this.lat});

  @override
  List<Object?> get props => [long, lat];
}
