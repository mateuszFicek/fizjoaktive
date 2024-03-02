part of 'patients_bloc.dart';

@freezed
class PatientsState with _$PatientsState {
  const factory PatientsState.initial() = _Initial;
  const factory PatientsState.patientsLoading() = _PatientsLoading;
  const factory PatientsState.patientsLoaded(List<PatientWithClient> patients) =
      _PatientsLoaded;

  const factory PatientsState.pushPatientPage(Patient patient) =
      _PushPatientPage;
}
