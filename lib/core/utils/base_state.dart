import 'package:equatable/equatable.dart';

import '../enums/request_status.dart';
import '../errors/failure.dart';

///The [BaseState] class expresses the general state of use of stats in the application,
/// each state or state of use ([Bloc] States),
/// and the state of the state management must be extends of this class.
///
/// [BaseState] has generic implementation, if you don't set T as a Type it be dynamic type be default
///
/// 1- [requestStatus] :
///     api request state can be one of this states
///     ([RequestStatus.init] ,[RequestStatus.error] , [RequestStatus.success] , [RequestStatus.loading] )
/// 2- [failure] :
///     error model that every screen has it to view custom error component [FailureComponent]
///     failure stored in error cases
/// 3- [data] :
///     data stored in success cases
///     [T] can be one of any dart [Object] or it will set [dynamic] by default
///
///  in your [Bloc] states you can use this class in follwing way:
///  Ex: class BlocState extends BaseState<YourEntity> {}
///
///  in [emit] new states in your bloc you just type
///  Ex: emit(state.loading());
///
///  in you screen you will switch case in [BlocBuilder] by check [requestStatus] values

class BaseState<T> extends Equatable {
  // Represents the status of a request
  final RequestStatus requestStatus;

  // Represents a failure that occurred during the request
  final Failure failure;

  // Represents the data associated with the request
  final T? data;

  const BaseState({
    this.requestStatus = RequestStatus.init,
    this.failure = const Failure('init Failure'),
    this.data,
  });

  // Creates a copy of the BaseState object with optional parameter values overridden
  BaseState<T> copyWith({
    RequestStatus? requestStatus,
    Failure? failure,
    T? data,
  }) =>
      BaseState<T>(
        data: data ?? this.data,
        failure: failure ?? this.failure,
        requestStatus: requestStatus ?? this.requestStatus,
      );

  @override
  List<Object?> get props => [requestStatus, failure, data];

  // Returns a new BaseState object with the request status set to loading
  BaseState<T> loading() {
    return copyWith(requestStatus: RequestStatus.loading);
  }

  // Returns a new BaseState object with the request status set to success and new data
  BaseState<T> success(T newData) {
    return copyWith(requestStatus: RequestStatus.success, data: newData);
  }

  // Returns a new BaseState object with the request status set to error and new failure
  BaseState<T> error(Failure newFailure) {
    return copyWith(requestStatus: RequestStatus.error, failure: newFailure);
  }

  // Returns a new BaseState object with the request status set to error and a default failure
  BaseState<T> defaultError() {
    return copyWith(
      requestStatus: RequestStatus.error,
      failure: UnknownFailure(),
    );
  }

  // Returns a new BaseState object with all properties reset to their initial values
  BaseState<T> reset() => BaseState<T>();

  // check is loading
  bool get isLoading => requestStatus == RequestStatus.loading;

  // check is success
  bool get isSuccess => requestStatus == RequestStatus.success;

  // check is init
  bool get isInit => requestStatus == RequestStatus.init;

  // check is error
  bool get isError => requestStatus == RequestStatus.error;

  // get state failure package
  String get errorMessage => failure.message;
}
