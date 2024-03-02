import 'package:dartz/dartz.dart';
import 'package:fizjoaktive/features/clients/domain/models/client.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/repositories/clients_repository_impl.dart';

@injectable
class SearchClientsWithQuery implements UseCase<void, String> {
  final ClientsRepository repository;

  SearchClientsWithQuery(this.repository);

  @override
  Future<Either<Failure, List<Client>>> call(String query) async {
    return await repository.searchClientsWithQuery(query);
  }
}
