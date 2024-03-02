import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/core/injectable/injectable_config.dart';
import 'package:fizjoaktive/core/utils/debouncer.dart';
import 'package:fizjoaktive/features/patients/domain/models/patient_with_client.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:fizjoaktive/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../domain/models/patient.dart';
import '../bloc/patients_bloc.dart';
import '../widgets/patients_list_item.dart';

@RoutePage()
class PatientsPage extends HookWidget {
  final searchDebouncer = Debouncer(delay: const Duration(milliseconds: 500));

  PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Pacjenci")),
      body: BlocConsumer<PatientsBloc, PatientsState>(
        bloc: getIt<PatientsBloc>()..add(const PatientsEvent.initPatients()),
        builder: (context, state) {
          return Column(
            children: [
              _buildSearchBar(searchController),
              state.maybeWhen(
                patientsLoading: () =>
                    const Center(child: CircularProgressIndicator()),
                patientsLoaded: (patients) =>
                    _buildLoadedPatients(context, patients),
                orElse: () => Container(),
              ),
            ],
          );
        },
        listener: (BuildContext context, PatientsState state) {
          state.mapOrNull(
            pushPatientPage: (state) =>
                _onNavigateToPatient(state.patient, searchController.text),
          );
        },
      ),
    );
  }

  Padding _buildSearchBar(TextEditingController searchController) {
    return Padding(
      padding: EdgeInsets.all(Sizes.gapSizes.size16),
      child: TextInput(
        controller: searchController,
        labelText: "Szukaj...",
        onChanged: (value) {
          searchDebouncer.run(() {
            getIt<PatientsBloc>().add(PatientsEvent.patientSearch(value));
          });
        },
      ),
    );
  }

  Widget _buildLoadedPatients(
      BuildContext context, List<PatientWithClient> patients) {
    return Flexible(
      child: ListView.separated(
        itemCount: patients.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PatientsListItem(patientWithClient: patients[index]);
        },
        separatorBuilder: (_, __) => Divider(
          indent: Sizes.gapSizes.size16,
          endIndent: Sizes.gapSizes.size16,
        ),
      ),
    );
  }

  Future<void> _onNavigateToPatient(Patient patient, String searchQuery) async {
    try {
      // await getIt<AppNavigator>().navigateToPatientPage(state.client);
      getIt<PatientsBloc>().add(PatientsEvent.patientSearch(searchQuery));
    } catch (e) {
      print(e);
    }
  }
}
