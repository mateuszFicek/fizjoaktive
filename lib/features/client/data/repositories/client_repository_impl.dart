import 'package:cached_annotation/cached_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../patients/domain/datasources/patients_datasource.dart';
import '../../../patients/domain/models/patient.dart';
part 'client_repository_impl.cached.dart';

@WithCache()
@singleton
abstract mixin class ClientRepository implements _$ClientRepository {
  @factoryMethod
  factory ClientRepository({
    required PatientsDataSource dataSource,
  }) = _ClientRepository;
}
