part of 'clients_bloc.dart';

sealed class ClientsState extends Equatable {
  const ClientsState();

  @override
  List<Object> get props => [];
}

final class ClientsInitial extends ClientsState {}

final class ClientsLoaded extends ClientsState {
  final List<Client> clients;

  const ClientsLoaded(this.clients);
}

final class ClientsLoading extends ClientsState {}

final class PushClientPage extends ClientsState {
  final Client client;

  const PushClientPage(this.client);
}
