import 'package:dartz/dartz.dart';
import 'package:fizjoaktive/features/clients/domain/models/client.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/repositories/clients_repository_impl.dart';

@injectable
class GetAllClients implements UseCase<void, void> {
  final ClientsRepository repository;

  GetAllClients(this.repository);

  @override
  Future<Either<Failure, List<Client>>> call(void _) async {
    return await repository.getAllClients();
  }
}
