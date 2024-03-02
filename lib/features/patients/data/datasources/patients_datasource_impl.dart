import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fizjoaktive/features/patients/domain/models/patient_visit.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/patient.dart';
import '../../domain/datasources/patients_datasource.dart';

@Injectable(as: PatientsDataSource)
class PatientsDataSourceImpl implements PatientsDataSource {
  @override
  Future<List<Patient>> getAllPatients() async {
    var userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) return [];
    var patientsMap = await FirebaseFirestore.instance
        .collection("users")
        .doc(userID)
        .collection('patients')
        .get();

    Map<String, List<PatientVisit>> patientsVisits = {};

    var patientsIDs = patientsMap.docs.map((element) => element.id);

    for (String patientID in patientsIDs) {
      var patientVisits = await getPatientVisits(userID, patientID);
      patientsVisits.putIfAbsent(
        patientID,
        () => patientVisits,
      );
    }
    return patientsMap.docs
        .map(
          (e) => Patient.fromFirestore(
            e.data(),
            e.id,
            visits: patientsVisits[e.id],
          ),
        )
        .toList();
  }

  Future<List<PatientVisit>> getPatientVisits(
      String userID, String patientID) async {
    final patientVisits = await FirebaseFirestore.instance
        .collection("users")
        .doc(userID)
        .collection('patients')
        .doc(patientID)
        .collection("visits")
        .get();
    return patientVisits.docs
        .map((visit) => PatientVisit.fromFirestore(visit.data()))
        .toList();
  }
}
