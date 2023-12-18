import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_dialogs.dart';
import 'package:dawrni/core/core_compoent/app_network_image.dart';
import 'package:dawrni/core/enums/company_appointment_status.dart';
import 'package:dawrni/core/extension/company_appointment_extentions/company_appointments_extention.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/features/appointments/domain/entities/company_appointment_entity.dart';
import 'package:dawrni/features/appointments/presentation/blocs/change_company_appointment_status_bloc%20copy/change_company_appointment_status_bloc.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CompanyAppointmentCard extends StatelessWidget {
  final CompanyAppointmentEntity appointment;
  const CompanyAppointmentCard({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.secondColor,
          borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPrimary: AppColors.lightGrey,
          padding: EdgeInsets.zero,
        ),
        onPressed: appointment.status != CompanyAppointmentStatus.pending ? null : () async {
                await AppDialogs.changeCompanyAppointmentStatusDialog(context)
                    .then((value) {
                  if (value != null) {
                    context.read<ChangeCompanyAppointmentStatusBloc>().add(
                        ChangeCompanyAppointmentStatusButtonPressedEvent(
                            id: appointment.id,
                            status: value));
                  }
                });
              },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appointment.clientName, style: context.f18600),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: appointment.status.decoration,
                    child: appointment.status.icon,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(color: AppColors.white2, thickness: 1.0),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined),
                  const SizedBox(width: 10),
                  Text(
                    DateFormat('dd MMM yyyy HH:mm:ss').format(appointment.date),
                    style:
                        context.f12400?.copyWith(color: AppColors.lighterGrey),
                  ),
                  const Spacer(),
                  SizedBox(
                      width: 35,
                      height: 35,
                      child: AppNetworkImage(
                        url: appointment.clientImage,
                        borderRadius: BorderRadius.circular(50),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
