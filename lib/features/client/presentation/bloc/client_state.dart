part of 'client_bloc.dart';

@freezed
class ClientState with _$ClientState {
  const factory ClientState.initial() = _Initial;
  const factory ClientState.clientDataLoaded(ClientDataViewModel viewModel) =
      _ClientDataLoaded;
}
