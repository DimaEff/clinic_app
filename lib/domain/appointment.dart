class Appointment {
  String start;
  String finish;
  String patientId;
  String doctorId;
  String specialty;

  Appointment({
    required this.start,
    required this.finish,
    required this.doctorId,
    required this.patientId,
    required this.specialty,
  });
}
