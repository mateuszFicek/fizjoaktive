import 'package:dartz/dartz.dart';
import 'package:fizjoaktive/features/client/domain/models/patient.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/repositories/client_repository_impl.dart';

@injectable
class GetClientPatients implements UseCase<void, String> {
  final ClientRepository repository;

  GetClientPatients(this.repository);

  @override
  Future<Either<Failure, List<Patient>>> call(String clientID) async {
    return await repository.getClientPatients(clientID);
  }
}
