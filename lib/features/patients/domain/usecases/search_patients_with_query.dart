import 'package:dartz/dartz.dart';
import 'package:fizjoaktive/features/patients/domain/models/patient.dart';
import 'package:fizjoaktive/features/patients/domain/models/patient_with_client.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/repositories/patients_repository_impl.dart';

@injectable
class SearchPatientsWithQuery implements UseCase<void, String> {
  final PatientsRepository repository;

  SearchPatientsWithQuery(this.repository);

  @override
  Future<Either<Failure, List<PatientWithClient>>> call(String query) async {
    return await repository.searchPatientsWithQuery(query);
  }
}
