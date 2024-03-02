import 'package:bloc/bloc.dart';
import 'package:fizjoaktive/features/client/domain/models/client_data_view_model.dart';
import 'package:fizjoaktive/features/patients/domain/usecases/get_client_patients.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../clients/domain/models/client.dart';

part 'client_event.dart';
part 'client_state.dart';
part 'client_bloc.freezed.dart';

@singleton
class ClientBloc extends Bloc<ClientEvent, ClientState> {
  GetClientPatients getClientPatients;
  ClientBloc(this.getClientPatients) : super(const _Initial()) {
    on<ClientEvent>((event, emit) async {
      await _onLoadClient(event, emit);
    });
  }

  Future<void> _onLoadClient(
      ClientEvent event, Emitter<ClientState> emit) async {
    if (event is! _LoadClient) return;
    emit(const ClientState.clientLoading());
    final patientsResponse = await getClientPatients(event.client.id);
    try {
      patientsResponse.fold(
        (l) => null,
        (r) {
          emit(
            ClientState.clientDataLoaded(ClientDataViewModel(patients: r)),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
