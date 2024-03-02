import 'package:freezed_annotation/freezed_annotation.dart';
part 'patient.freezed.dart';

@freezed
class Patient with _$Patient {
  const Patient._();

  const factory Patient({
    required String name,
    required String parentID,
  }) = _Patient;

  factory Patient.fromFirestore(Map<String, dynamic> firestoreData) {
    return Patient(
      name: firestoreData['name'] as String,
      parentID: firestoreData['parentID'] as String,
    );
  }
}
