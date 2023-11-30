import 'package:equatable/equatable.dart';

class AddToFavoritesParameters extends Equatable {
  final int id;

  const AddToFavoritesParameters({required this.id});

  Map<String, dynamic> toJson() => {};

  String toQueryParameters() => "$id";

  @override
  List<Object?> get props => [id];
}
