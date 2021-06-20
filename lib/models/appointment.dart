class Appointment {
  int id;
  int doctorId;
  int patientId;
  int treatmentId;
  String appointmentDate;
  bool isActive;
  Appointment();

  Appointment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        doctorId = json['doctor_id'],
        patientId = json['patient_id'],
        treatmentId = json['treatment_id'],
        appointmentDate = json['appointment_date'],
        isActive = json['is_active'];

  Map<String, dynamic> toJson() => {
        'doctor_id': doctorId,
        'treatment_id': treatmentId,
        'appointment_date': appointmentDate,
      };
}
