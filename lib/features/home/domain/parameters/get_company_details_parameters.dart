import 'package:equatable/equatable.dart';

class GetCompanyDetailsParameters extends Equatable {
  final String id;
  const GetCompanyDetailsParameters({
    required this.id
});

  Map<String, dynamic> toJson() => {
    'id' : id
  };

  @override
  List<Object> get props => [id];
}
