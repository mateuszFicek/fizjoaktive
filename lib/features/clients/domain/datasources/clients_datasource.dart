import 'package:firebase_auth/firebase_auth.dart';

import '../models/client.dart';

abstract class ClientsDataSource {
  Future<List<Client>> getAllClients();
}
