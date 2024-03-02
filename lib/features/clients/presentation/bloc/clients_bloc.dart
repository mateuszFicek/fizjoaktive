import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fizjoaktive/features/clients/domain/usecases/get_all_clients.dart';
import 'package:fizjoaktive/features/clients/domain/usecases/search_clients_with_query.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/client.dart';

part 'clients_event.dart';
part 'clients_state.dart';

@singleton
class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  GetAllClients getAllClients;
  SearchClientsWithQuery searchClientsWithQuery;
  ClientsBloc(this.getAllClients, this.searchClientsWithQuery)
      : super(ClientsInitial()) {
    on<InitClients>(_onInitClients);
    on<ClientSearch>(_onSearch);
    on<NavigateToClient>(_onNavigateToClient);
  }

  void _onInitClients(InitClients event, Emitter<ClientsState> emit) async {
    emit(ClientsLoading());
    final maybeClients = await getAllClients(null);
    maybeClients.fold((l) => null, (r) => emit(ClientsLoaded(r)));
  }

  void _onSearch(ClientSearch event, Emitter<ClientsState> emit) async {
    emit(ClientsLoading());
    final searchResponse = await searchClientsWithQuery(event.searchValue);
    searchResponse.fold((l) => null, (r) {
      emit(ClientsLoaded(r));
    });
  }

  void _onNavigateToClient(NavigateToClient event, Emitter<ClientsState> emit) {
    emit(PushClientPage(event.client));
  }
}
