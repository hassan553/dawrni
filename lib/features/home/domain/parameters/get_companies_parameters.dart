import 'package:equatable/equatable.dart';

class GetCompaniesParameters extends Equatable {
  final int? offset;
  final int? limit;
  final String? search;
  final String category;


  const GetCompaniesParameters({this.offset = 0, this.limit = 10, this.search = '', this.category = ''});

  Map<String, dynamic> toJson() => {};

  String toQueryParameters() => "?limit=$limit&offset=$offset&search=$search&category=$category";

  @override
  List<Object?> get props => [offset, limit, search, category];
}
