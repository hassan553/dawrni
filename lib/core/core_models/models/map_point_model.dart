import '../entities/map_point_entity.dart';

class MapPointModel extends MapPointEntity {
  const MapPointModel({required super.long, required super.lat});

  factory MapPointModel.fromJson(Map<String, dynamic> json) {
    return MapPointModel(
      long: json['long'],
      lat: json['lat'],
    );
  }
}
