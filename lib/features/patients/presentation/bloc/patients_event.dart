part of 'patients_bloc.dart';

@freezed
class PatientsEvent with _$PatientsEvent {
  const factory PatientsEvent.started() = _Started;
  const factory PatientsEvent.initPatients() = _InitPatients;
  const factory PatientsEvent.patientSearch(String query) = _PatientSearch;
  const factory PatientsEvent.navigateToPatient(Patient patient) =
      _NavigateToPatient;
}
