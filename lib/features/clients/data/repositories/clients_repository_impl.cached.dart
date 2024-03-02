// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

part of 'clients_repository_impl.dart';

// **************************************************************************
// CachedGenerator
// **************************************************************************

abstract class _$ClientsRepository {
  ClientsDataSource get dataSource;
}

class _ClientsRepository with ClientsRepository implements _$ClientsRepository {
  _ClientsRepository({required this.dataSource});

  @override
  final ClientsDataSource dataSource;

  final _getAllClientsCached = <String, Either<Failure, List<Client>>>{};

  @override
  Future<Either<Failure, List<Client>>> getAllClients() async {
    final cachedValue = _getAllClientsCached[""];
    if (cachedValue == null) {
      final Either<Failure, List<Client>> toReturn;
      try {
        final result = super.getAllClients();

        toReturn = await result;
      } catch (_) {
        rethrow;
      } finally {}

      _getAllClientsCached[""] = toReturn;

      return toReturn;
    } else {
      return cachedValue;
    }
  }
}
