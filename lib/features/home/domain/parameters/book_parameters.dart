import 'package:equatable/equatable.dart';

class BookParameters extends Equatable {
  final int companyId;
  final DateTime dateTime;
  const BookParameters({
    required this.companyId,
    required this.dateTime
});

  Map<String, dynamic> toJson() => {
    'id' : companyId,
    'dateTime' : dateTime.toIso8601String()
  };

  @override
  List<Object> get props => [companyId, dateTime];
}
