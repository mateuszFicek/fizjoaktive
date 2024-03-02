import 'package:cached_annotation/cached_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/datasources/clients_datasource.dart';
import '../../domain/models/client.dart';
part 'clients_repository_impl.cached.dart';

@WithCache()
@singleton
abstract mixin class ClientsRepository implements _$ClientsRepository {
  @factoryMethod
  factory ClientsRepository({
    required ClientsDataSource dataSource,
  }) = _ClientsRepository;

  @Cached()
  Future<Either<Failure, List<Client>>> getAllClients() async {
    try {
      final clients = await dataSource.getAllClients();
      return Right(clients);
    } catch (e) {
      print(e);
      return const Left(
        FirebaseAuthFailure("Błąd przy pobieraniu danych klientów."),
      );
    }
  }

  Future<Either<Failure, List<Client>>> searchClientsWithQuery(
      String query) async {
    try {
      final clients = await dataSource.getAllClients();
      final queryClients = clients.where(
        (element) =>
            element.name.toLowerCase().contains(query.toLowerCase()) ||
            element.address.toLowerCase().contains(query.toLowerCase()),
      );
      return Right(queryClients.toList());
    } catch (e) {
      return const Left(
        FirebaseAuthFailure("Błąd przy wyszukiwaniu."),
      );
    }
  }
}
