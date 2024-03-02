import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fizjoaktive/features/authentication/domain/datasources/authentication_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../domain/datasources/client_datasource.dart';
import '../../domain/models/patient.dart';

@Injectable(as: ClientDataSource)
class ClientDataSourceImpl implements ClientDataSource {
  @override
  Future<List<Patient>> getAllPatients() async {
    var db = FirebaseFirestore.instance;

    final patients = await db.collection("patients").get();

    return patients.docs.map((e) => Patient.fromFirestore(e.data())).toList();
  }
}
