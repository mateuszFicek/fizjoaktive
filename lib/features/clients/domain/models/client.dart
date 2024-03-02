import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'client.freezed.dart';

@freezed
class Client with _$Client {
  const Client._();

  const factory Client({
    required String name,
    required String address,
    required List<String> patientsIDs,
    required DateTime lastVisit,
  }) = _Client;

  factory Client.fromFirestore(Map<String, dynamic> firestoreData) {
    return Client(
      name: firestoreData['name'] as String,
      address: firestoreData['address'] as String,
      lastVisit: (firestoreData['lastVisit'] as Timestamp).toDate(),
      patientsIDs:
          List<String>.from(firestoreData['patientsIDs'] as List<dynamic>),
    );
  }
}
