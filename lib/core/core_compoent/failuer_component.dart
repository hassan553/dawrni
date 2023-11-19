/// This file contains a set of components for displaying different types of failures in a Flutter application.
/// Each failure type has its own corresponding component that handles the visual representation of the failure.

import 'package:dawrni/core/core_compoent/app_button.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// The [FailureComponent] class is a generic component that takes a [Failure] object and dynamically selects the appropriate
/// sub-component based on the runtime type of the failure. It uses a switch statement to determine the failure type and
/// returns the corresponding component for that type.
///

// TODO: customize failure Components view

class FailureComponent extends StatelessWidget {
  const FailureComponent({super.key, required this.failure, this.retry});

  final Failure failure;
  final VoidCallback? retry;

  static void handleFailure({required BuildContext context,required Failure failure}) {
    switch (failure.runtimeType) {
      case SessionExpiredFailure:
        _logout(context);
      case NoInternetFailure:
      case ServerFailure:
      case UnknownFailure:
      case ForceUpdateFailure:
      case AppUnderMaintenanceFailure:
      case ParsingFailure:
        showToast(message: failure.message);
        break;
      default:
        showToast(message: failure.message);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // logger.d(
    //     "============== build failure ================= \n ${failure.runtimeType.toString()}");

    if(failure is SessionExpiredFailure) {
      _logout(context);

      return const SizedBox();
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 150.w),
          const SizedBox(height: 20),
          Text(
            failure.message,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          if(retry != null)
            AppButton(onPressed: retry!, text: S.of(context).tryAgain)
        ],
      ),
    );

    switch (failure.runtimeType) {
      /// NoInternetFailureComponent handles the case when there is no internet connectivity.
      case NoInternetFailure:
        return NoInternetFailureComponent(
            failure: failure as NoInternetFailure);

      /// ServerFailureComponent handles the case when there is a failure related to the server.
      case ServerFailure:
        return ServerFailureComponent(failure: failure as ServerFailure);

      /// UnknownFailureComponent handles the case when an unknown failure occurs.
      case UnknownFailure:
        return UnknownFailureComponent(failure: failure as UnknownFailure);

      /// ForceUpdateFailureComponent handles the case when the app requires an update.
      case ForceUpdateFailure:
        return ForceUpdateFailureComponent(
            failure: failure as ForceUpdateFailure);

      /// AppUnderMaintenanceFailureComponent handles the case when the app is under maintenance.
      case AppUnderMaintenanceFailure:
        return AppUnderMaintenanceFailureComponent(
            failure: failure as AppUnderMaintenanceFailure);

      /// SessionExpiredFailureComponent handles the case when the session has expired due to inactivity.
      case SessionExpiredFailure:
        return SessionExpiredFailureComponent(
            failure: failure as SessionExpiredFailure);

      /// ParsingFailureComponent handles the case when there is a failure in parsing the response.
      case ParsingFailure:
        return ParsingFailureComponent(failure: failure as ParsingFailure);

      /// Placeholder is a generic component used when the failure type is not recognized.
      default:
        return const Placeholder();
    }
  }
  static void _logout(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
        // context.read<AppConfigBloc>().add(const LogOutEvent());
        context.go(LoginRoute.name);
      },
    );
  }
}

/// The [NoInternetFailureComponent] handles the visual representation of the NoInternetFailure type.
///
class NoInternetFailureComponent extends StatelessWidget {
  const NoInternetFailureComponent({super.key, required this.failure});
  final NoInternetFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure.message,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

/// The [ServerFailureComponent] handles the visual representation of the ServerFailure type.
///
class ServerFailureComponent extends StatelessWidget {
  const ServerFailureComponent({super.key, required this.failure});
  final ServerFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure.toString(),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

/// The [UnknownFailureComponent] handles the visual representation of the UnknownFailure type.
///
class UnknownFailureComponent extends StatelessWidget {
  const UnknownFailureComponent({super.key, required this.failure});
  final UnknownFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure.message,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

/// The [ForceUpdateFailureComponent] handles the visual representation of the ForceUpdateFailure type.
///
class ForceUpdateFailureComponent extends StatelessWidget {
  const ForceUpdateFailureComponent({super.key, required this.failure});
  final ForceUpdateFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure.message,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

/// The [AppUnderMaintenanceFailureComponent] handles the visual representation of the AppUnderMaintenanceFailure type.
///
class AppUnderMaintenanceFailureComponent extends StatelessWidget {
  const AppUnderMaintenanceFailureComponent({super.key, required this.failure});
  final AppUnderMaintenanceFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure.message,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

/// The [SessionExpiredFailureComponent] handles the visual representation of the SessionExpiredFailure type.
///
class SessionExpiredFailureComponent extends StatelessWidget {
  const SessionExpiredFailureComponent({super.key, required this.failure});
  final SessionExpiredFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure.message,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

/// The [ParsingFailureComponent] handles the visual representation of the ParsingFailure type.
///
class ParsingFailureComponent extends StatelessWidget {
  const ParsingFailureComponent({super.key, required this.failure});
  final ParsingFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure.toString(),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
