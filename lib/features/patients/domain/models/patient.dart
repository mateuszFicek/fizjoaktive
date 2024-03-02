import 'package:freezed_annotation/freezed_annotation.dart';

import 'patient_visit.dart';
part 'patient.freezed.dart';

@freezed
class Patient with _$Patient {
  const Patient._();

  const factory Patient({
    required String name,
    required String parentID,
    required String id,
    required List<PatientVisit> visits,
  }) = _Patient;

  factory Patient.fromFirestore(Map<String, dynamic> firestoreData, String id,
      {List<PatientVisit>? visits}) {
    return Patient(
      name: firestoreData['name'] as String,
      parentID: firestoreData['parentID'] as String,
      id: id,
      visits: visits ?? [],
    );
  }
}
