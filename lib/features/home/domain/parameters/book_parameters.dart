import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class BookParameters extends Equatable {
  final int companyId;
  final DateTime dateTime;
  const BookParameters({
    required this.companyId,
    required this.dateTime
});

  Map<String, dynamic> toJson() => {
    'date' : DateFormat('yyyy-MM-dd').format(dateTime),
    'time' : DateFormat('HH:mm:ss').format(dateTime)
  };

  String toQueryParameters() => "$companyId";

  @override
  List<Object> get props => [companyId, dateTime];
}
