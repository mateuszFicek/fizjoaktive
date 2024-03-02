import 'package:bloc/bloc.dart';
import 'package:fizjoaktive/features/patients/domain/models/patient_with_client.dart';
import 'package:fizjoaktive/features/patients/domain/usecases/get_all_patients.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/patient.dart';
import '../../domain/usecases/get_all_patients_with_clients.dart';
import '../../domain/usecases/search_patients_with_query.dart';

part 'patients_event.dart';
part 'patients_state.dart';
part 'patients_bloc.freezed.dart';

@singleton
class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  GetAllPatients getAllPatients;
  GetAllPatientsWithClientsData getAllPatientsWithClientsData;
  SearchPatientsWithQuery searchPatientsWithQuery;
  PatientsBloc(this.getAllPatients, this.getAllPatientsWithClientsData,
      this.searchPatientsWithQuery)
      : super(const _Initial()) {
    on<PatientsEvent>((event, emit) async {
      await _onLoadPatients(event, emit);
      await _onSearch(event, emit);
    });
  }

  Future<void> _onLoadPatients(
      PatientsEvent event, Emitter<PatientsState> emit) async {
    if (event is! _InitPatients) return;
    try {
      emit(const PatientsState.patientsLoading());
      final patientsResponse = await getAllPatientsWithClientsData(null);
      patientsResponse.fold(
        (l) => null,
        (r) => emit(PatientsState.patientsLoaded(r)),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onSearch(
      PatientsEvent event, Emitter<PatientsState> emit) async {
    if (event is! _PatientSearch) return;
    emit(const PatientsState.patientsLoading());
    final searchResponse = await searchPatientsWithQuery(event.query);
    searchResponse.fold((l) => null, (r) {
      emit(PatientsState.patientsLoaded(r));
    });
  }
}
