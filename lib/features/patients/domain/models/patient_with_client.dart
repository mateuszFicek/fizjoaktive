import 'package:fizjoaktive/features/clients/domain/models/client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'patient.dart';
part 'patient_with_client.freezed.dart';

@freezed
class PatientWithClient with _$PatientWithClient {
  const PatientWithClient._();

  const factory PatientWithClient({
    required Patient patient,
    required Client client,
  }) = _PatientWithClient;
}
