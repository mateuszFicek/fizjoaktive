part of 'client_bloc.dart';

@freezed
sealed class ClientState with _$ClientState {
  const factory ClientState.initial() = _Initial;
  const factory ClientState.clientLoading() = _ClientLoading;
  const factory ClientState.clientDataLoaded(ClientDataViewModel viewModel) =
      _ClientDataLoaded;
}
