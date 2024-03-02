import 'package:fizjoaktive/core/injectable/injectable_config.dart';
import 'package:fizjoaktive/features/patients/domain/models/patient_with_client.dart';
import 'package:fizjoaktive/features/patients/presentation/bloc/patients_bloc.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:flutter/material.dart';

import '../../../../theme/text_theme.dart';
import '../../domain/models/patient.dart';

class PatientsListItem extends StatelessWidget {
  const PatientsListItem({
    super.key,
    required this.patientWithClient,
  });

  final PatientWithClient patientWithClient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<PatientsBloc>().add(
          PatientsEvent.navigateToPatient(patientWithClient.patient),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.gapSizes.size16,
          vertical: Sizes.gapSizes.size8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  patientWithClient.patient.name,
                  style: CustomTextTheme.header1BoldTextStyle,
                ),
                Text(
                  patientWithClient.client.name,
                  style: CustomTextTheme.header2TextStyle,
                ),
                Text(
                  "Liczba wizyt: ${patientWithClient.patient.visits.length.toString()}",
                  style: CustomTextTheme.header2TextStyle,
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                getIt<PatientsBloc>().add(
                    PatientsEvent.navigateToPatient(patientWithClient.patient));
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
