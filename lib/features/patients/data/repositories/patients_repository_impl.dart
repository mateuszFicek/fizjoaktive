import 'package:cached_annotation/cached_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:fizjoaktive/features/clients/domain/datasources/clients_datasource.dart';
import 'package:fizjoaktive/features/patients/domain/models/patient.dart';
import 'package:fizjoaktive/features/patients/domain/models/patient_with_client.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/datasources/patients_datasource.dart';
part 'patients_repository_impl.cached.dart';

@WithCache()
@singleton
abstract mixin class PatientsRepository implements _$PatientsRepository {
  @factoryMethod
  factory PatientsRepository({
    required PatientsDataSource dataSource,
    required ClientsDataSource clientsDataSource,
  }) = _PatientsRepository;

  @Cached()
  Future<Either<Failure, List<Patient>>> getAllPatients() async {
    try {
      final patients = await dataSource.getAllPatients();
      return Right(patients);
    } catch (e) {
      print(e);
      return const Left(
        FirebaseAuthFailure("Błąd przy pobieraniu danych klientów."),
      );
    }
  }

  @Cached()
  Future<Either<Failure, List<PatientWithClient>>>
      getAllPatientsWithClientsData() async {
    try {
      final patients = await dataSource.getAllPatients();
      final clients = await clientsDataSource.getAllClients();
      final patientsWithClients = patients.map(
        (e) => PatientWithClient(
            patient: e,
            client: clients.firstWhere((element) => element.id == e.parentID)),
      );

      return Right(patientsWithClients.toList());
    } catch (e) {
      print(e);
      return const Left(
        FirebaseAuthFailure("Błąd przy pobieraniu danych klientów."),
      );
    }
  }

  Future<Either<Failure, List<PatientWithClient>>> searchPatientsWithQuery(
      String query) async {
    try {
      final patients = await dataSource.getAllPatients();
      final queryPatients = patients.where(
        (element) => element.name.toLowerCase().contains(query.toLowerCase()),
      );

      final clients = await clientsDataSource.getAllClients();
      final patientsWithClients = queryPatients.map(
        (e) => PatientWithClient(
            patient: e,
            client: clients.firstWhere((element) => element.id == e.parentID)),
      );
      return Right(patientsWithClients.toList());
    } catch (e) {
      return const Left(
        FirebaseAuthFailure("Błąd przy wyszukiwaniu."),
      );
    }
  }

  @Cached()
  Future<Either<Failure, List<Patient>>> getClientPatients(
      String clientID) async {
    try {
      final patients = await dataSource.getAllPatients();
      final clientPatients =
          patients.where((element) => element.parentID == clientID);
      return Right(clientPatients.toList());
    } catch (e) {
      print(e);
      return const Left(
        FirebaseAuthFailure("Błąd przy pobieraniu danych klientów."),
      );
    }
  }
}
