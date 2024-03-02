part of 'clients_bloc.dart';

sealed class ClientsEvent extends Equatable {
  const ClientsEvent();

  @override
  List<Object> get props => [];
}

class InitClients extends ClientsEvent {}

class ClientSearch extends ClientsEvent {
  final String searchValue;

  const ClientSearch(this.searchValue);
}

class NavigateToClient extends ClientsEvent {
  final Client client;

  const NavigateToClient(this.client);
}
