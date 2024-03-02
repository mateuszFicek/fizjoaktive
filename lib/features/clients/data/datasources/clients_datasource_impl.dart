import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fizjoaktive/features/authentication/domain/datasources/authentication_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../domain/datasources/clients_datasource.dart';
import '../../domain/models/client.dart';

@Injectable(as: ClientsDataSource)
class ClientsDataSourceImpl implements ClientsDataSource {
  @override
  Future<List<Client>> getAllClients() async {
    var userID = FirebaseAuth.instance.currentUser?.uid;
    var collection = await FirebaseFirestore.instance
        .collection("users")
        .doc(userID)
        .collection('clients')
        .get();

    return collection.docs
        .map((e) => Client.fromFirestore(e.data(), e.id))
        .toList();
  }
}
