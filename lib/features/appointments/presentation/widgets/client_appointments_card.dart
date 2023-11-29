import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_network_image.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/features/appointments/domain/entities/client_appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClientAppointmentCard extends StatelessWidget {
  final ClientAppointmentEntity appointment;
  const ClientAppointmentCard({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.secondColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appointment.companyName, style: context.f18600),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor.withOpacity(appointment.checked ? 1 : 0.1),
                ),
                child: Icon(Icons.check, color: Colors.white.withOpacity(appointment.checked ? 1 : 0.1)),
              ),
            ],
          ),
          Text(appointment.companyCategory.name, style: context.f12400?.copyWith(color: AppColors.lighterGrey)),
          const SizedBox(height: 20),
          const Divider(color: AppColors.white2, thickness: 1.0),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined),
              const SizedBox(width: 10),
              Text(DateFormat('dd MMM yyyy').format(appointment.date), style: context.f12400?.copyWith(color: AppColors.lighterGrey),),
              const Spacer(),
              SizedBox(
                width: 35,
                  height: 35,
                  child: AppNetworkImage(url: appointment.companyImage, borderRadius: BorderRadius.circular(50),)),
            ],
          ),
        ],
      ),
    );
  }
}
