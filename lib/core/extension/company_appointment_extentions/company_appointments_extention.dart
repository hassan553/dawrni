import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/enums/company_appointment_status.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';

extension CompanyAppointmentStatusExtenstions on CompanyAppointmentStatus {

  Icon get icon {
    switch (this) {
      case CompanyAppointmentStatus.pending:
        return Icon(Icons.check, color: Colors.white.withOpacity(0.1));
      case CompanyAppointmentStatus.confirmed:
        return Icon(Icons.check, color: Colors.white.withOpacity(1));
      case CompanyAppointmentStatus.canceled:
        return Icon(Icons.close, color: Colors.white.withOpacity(1));
    }
  }

  BoxDecoration get decoration {
    switch (this) {
      case CompanyAppointmentStatus.pending:
        return BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor.withOpacity(0.1),
        );
      case CompanyAppointmentStatus.confirmed:
        return BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor.withOpacity(1),
        );
      case CompanyAppointmentStatus.canceled:
        return BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.red.withOpacity(1),
        );
    }
  }

  String get text {
    switch (this) {
      case CompanyAppointmentStatus.pending:
        return S.current.pending;
      case CompanyAppointmentStatus.confirmed:
        return S.current.confirm;
      case CompanyAppointmentStatus.canceled:
        return S.current.cancel;
    }
  }
}