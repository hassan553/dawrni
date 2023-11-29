part of 'book_bloc.dart';

sealed class BookEvent extends Equatable {
  const BookEvent();
  @override
  List<Object> get props => [];
}

class BookButtonPressedEvent extends BookEvent {
  final int companyId;
  final DateTime dateTime;
  const BookButtonPressedEvent({required this.companyId, required this.dateTime});
}
