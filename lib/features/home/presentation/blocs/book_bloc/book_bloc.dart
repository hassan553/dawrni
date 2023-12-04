import 'dart:async';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/domain/parameters/book_parameters.dart';
import 'package:dawrni/features/home/domain/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/base_state.dart';

part 'book_event.dart';

class BookBloc extends Bloc<BookEvent, BaseState<void>> {
  final HomeRepository homeRepository;

  BookBloc(this.homeRepository) : super(const BaseState<void>()) {
    on<BookButtonPressedEvent>(_book);
  }

  FutureOr<void> _book(BookButtonPressedEvent event, emit) async {
    emit(state.loading());
    final result = await homeRepository.bookAppointment(
        BookParameters(companyId: event.companyId, dateTime: event.dateTime));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
