import 'package:dartz/dartz.dart';
import 'package:fizjoaktive/features/patients/domain/models/patient.dart';
import 'package:fizjoaktive/features/patients/domain/models/patient_with_client.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/repositories/patients_repository_impl.dart';

@injectable
class GetAllPatientsWithClientsData implements UseCase<void, void> {
  final PatientsRepository repository;

  GetAllPatientsWithClientsData(this.repository);

  @override
  Future<Either<Failure, List<PatientWithClient>>> call(_) async {
    return await repository.getAllPatientsWithClientsData();
  }
}
