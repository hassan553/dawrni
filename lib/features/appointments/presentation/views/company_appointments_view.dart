import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/loading_compoent.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/appointments/domain/entities/company_appointment_entity.dart';
import 'package:dawrni/features/appointments/presentation/blocs/change_company_appointment_status_bloc%20copy/change_company_appointment_status_bloc.dart';
import 'package:dawrni/features/appointments/presentation/blocs/company_appointments_bloc/company_appointments_bloc.dart';
import 'package:dawrni/features/appointments/presentation/widgets/company_appointment_card.dart';
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CompanyAppointmentsView extends StatelessWidget {
  const CompanyAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppConfigBloc, AppConfigState>(
      listenWhen: (prev, curr) => prev.language != curr.language,
      listener: (context, state) {
        getCompanyAppointments(context, refresh: true);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
        child:
            BlocListener<ChangeCompanyAppointmentStatusBloc, BaseState<void>>(
          listener: (context, state) {
            if (state.isLoading) {
              LoadingComponent.showProgressModal(context);
            } else if (state.isError) {
              FailureComponent.handleFailure(
                  context: context, failure: state.failure);
              context.pop();
            } else if (state.isSuccess) {
              showToast(message: S.of(context).success);
              getCompanyAppointments(context, refresh: true);
              context.pop();
            }
          },
          child: BlocBuilder<CompanyAppointmentsBloc,
              BaseState<CompanyAppointmentsEntity>>(
            builder: (context, state) {
              if (state.isLoading) {
                return const LoadingComponent();
              } else if (state.isError) {
                return FailureComponent(
                    failure: state.failure,
                    retry: () => getCompanyAppointments(context));
              } else if (state.isSuccess) {
                return SmartRefresher(
                  controller:
                      context.read<CompanyAppointmentsBloc>().refreshController,
                  onRefresh: () =>
                      getCompanyAppointments(context, refresh: true),
                  onLoading: () => getCompanyAppointments(context),
                  enablePullUp: state.enablePullUp,
                  child: ListView(
                    children: [
                      const SizedBox(height: 40),
                      Text(S.of(context).clientAppointmentsMessage,
                          style: context.f28800),
                      const SizedBox(height: 20),
                      ...state.data?.appointments
                              .map(
                                  (e) => CompanyAppointmentCard(appointment: e))
                              .toList() ??
                          [],
                      const SizedBox(height: 30),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  void getCompanyAppointments(BuildContext context, {bool refresh = false}) {
    context
        .read<CompanyAppointmentsBloc>()
        .add(FetchCompanyAppointmentsEvent(refresh: refresh));
  }
}
