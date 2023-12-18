enum CompanyAppointmentStatus {
  pending('pending'),
  confirmed('confirmed'),
  canceled('canceled');

  const CompanyAppointmentStatus(this.type);
  final String type;
}
