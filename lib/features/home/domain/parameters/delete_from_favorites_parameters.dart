import 'package:equatable/equatable.dart';

class DeleteFromFavoritesParameters extends Equatable {
  final int id;

  const DeleteFromFavoritesParameters({required this.id});

  Map<String, dynamic> toJson() => {};

  String toQueryParameters() => "$id";

  @override
  List<Object?> get props => [id];
}
