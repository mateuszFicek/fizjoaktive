import 'package:cached_annotation/cached_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/datasources/client_datasource.dart';
import '../../domain/models/patient.dart';
part 'client_repository_impl.cached.dart';

@WithCache()
@singleton
abstract mixin class ClientRepository implements _$ClientRepository {
  @factoryMethod
  factory ClientRepository({
    required ClientDataSource dataSource,
  }) = _ClientRepository;

  @Cached()
  Future<Either<Failure, List<Patient>>> getClientPatients(
      String clientID) async {
    try {
      final patients = await dataSource.getAllPatients();
      final clientPatients =
          patients.where((element) => element.parentID == clientID);
      return Right(clientPatients.toList());
    } catch (e) {
      return const Left(
        FirebaseAuthFailure("Błąd przy pobieraniu danych klientów."),
      );
    }
  }
}
