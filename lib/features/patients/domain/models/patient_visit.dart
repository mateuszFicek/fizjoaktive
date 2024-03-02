import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'patient_visit.freezed.dart';

@freezed
class PatientVisit with _$PatientVisit {
  const PatientVisit._();

  const factory PatientVisit({
    required DateTime date,
  }) = _PatientVisit;

  factory PatientVisit.fromFirestore(Map<String, dynamic> firestoreData) {
    return PatientVisit(
      date: (firestoreData['date'] as Timestamp).toDate(),
    );
  }
}
