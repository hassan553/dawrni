import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/loading_compoent.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/appointments/domain/entities/client_appointment_entity.dart';
import 'package:dawrni/features/appointments/presentation/blocs/client_appointments_bloc/client_appointments_bloc.dart';
import 'package:dawrni/features/appointments/presentation/blocs/delete_client_appointment_bloc/delete_client_appointment_bloc.dart';
import 'package:dawrni/features/appointments/presentation/blocs/delete_client_appointment_bloc/delete_client_appointment_bloc.dart';
import 'package:dawrni/features/appointments/presentation/widgets/client_appointments_card.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ClientAppointmentsView extends StatelessWidget {
  ClientAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
      child: BlocListener<DeleteClientAppointmentBloc, BaseState<void>>(
        listener: (context, state) {
          if(state.isLoading) {
            LoadingComponent.showProgressModal(context);
          } else if (state.isError) {
            FailureComponent.handleFailure(context: context, failure: state.failure);
            context.pop();
          } else if (state.isSuccess) {
            showToast(message: S.of(context).success);
            getClientAppointments(context, refresh: true);
            context.pop();
          }
        },
        child: BlocBuilder<ClientAppointmentsBloc, BaseState<ClientAppointmentsEntity>>(
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingComponent();
          } else if (state.isError) {
            return FailureComponent(failure: state.failure, retry: () => getClientAppointments(context));
          } else if (state.isSuccess) {
            return Expanded(
              child: SmartRefresher(
                controller: context.read<ClientAppointmentsBloc>().refreshController,
                onRefresh: () => getClientAppointments(context, refresh: true),
                onLoading: () => getClientAppointments(context),
                enablePullUp: state.enablePullUp,
                child: ListView(
                  children: [
                    const SizedBox(height: 40),
                    Text(S.of(context).clientAppointmentsMessage, style: context.f28800),
                    const SizedBox(height: 20),
                    ...state.data?.appointments.map((e) => ClientAppointmentCard(appointment: e)).toList() ?? [],
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
),
    );
  }

  void getClientAppointments(BuildContext context, {bool refresh = false}) {
    context
        .read<ClientAppointmentsBloc>()
        .add(FetchClientAppointmentsEvent(refresh: refresh));
  }
  
}
