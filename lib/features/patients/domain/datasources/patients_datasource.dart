import 'package:fizjoaktive/features/patients/domain/models/patient.dart';

abstract class PatientsDataSource {
  Future<List<Patient>> getAllPatients();
}
