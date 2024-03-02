import '../models/patient.dart';

abstract class ClientDataSource {
  Future<List<Patient>> getAllPatients();
}
