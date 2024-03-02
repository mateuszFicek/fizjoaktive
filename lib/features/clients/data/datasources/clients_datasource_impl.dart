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
    var db = FirebaseFirestore.instance;

    final clients = await db.collection("clients").get();

    return clients.docs
        .map((e) => Client.fromFirestore(e.data(), e.id))
        .toList();
  }
}
