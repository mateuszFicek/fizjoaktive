import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/core/injectable/injectable_config.dart';
import 'package:fizjoaktive/core/utils/date_utils.dart';
import 'package:fizjoaktive/theme/app_colors.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../theme/text_theme.dart';
import '../../../../widgets/custom_persistent_header_delegate.dart';
import '../../../clients/domain/models/client.dart';
import '../../../patients/domain/models/patient.dart';
import '../bloc/client_bloc.dart';

@RoutePage()
class ClientPage extends StatelessWidget {
  final Client client;
  const ClientPage({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Szczegóły klienta")),
      body: _body(),
    );
  }

  Widget _body() {
    return BlocBuilder<ClientBloc, ClientState>(
      bloc: getIt<ClientBloc>()..add(ClientEvent.loadClient(client)),
      builder: (context, state) {
        return state.maybeWhen(
          clientDataLoaded: (viewModel) {
            return Padding(
              padding: EdgeInsets.all(Sizes.spacingSizes.size16),
              child: CustomScrollView(
                slivers: [
                  _buildClientInfo(viewModel.patients),
                  SliverToBoxAdapter(
                    child: SizedBox(height: Sizes.gapSizes.size16),
                  ),
                  _buildPatientsTitle(context, viewModel.patients.length),
                  _buildPatientsList(viewModel.patients),
                ],
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }

  Widget _buildClientInfo(List<Patient> patients) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  color: AppColors.darkBlue,
                  width: 2,
                ),
                Gap(Sizes.gapSizes.size8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      client.name,
                      style: CustomTextTheme.titleTextStyle,
                    ),
                    Text(
                      client.address,
                      style: CustomTextTheme.header2TextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Ostatnia wizyta: ${client.lastVisit.fullDateAndHour}",
                      style: CustomTextTheme.header2TextStyle,
                    ),
                    Text(
                      "Liczba wizyt: ${patients.fold(0, (previousValue, element) => previousValue += element.visits.length)}",
                      style: CustomTextTheme.header2TextStyle,
                    ),
                    Text(
                      "Liczba pacjentów: ${patients.length}",
                      style: CustomTextTheme.header2TextStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientsTitle(BuildContext context, int patientsLength) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: CustomSliverPersistentHeaderDelegate(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          height: 50,
          width: double.maxFinite,
          child: Text(
            "Pacjenci",
            style: CustomTextTheme.titleTextStyle,
          ),
        ),
        minHeight: 50,
        maxHeight: 50,
      ),
    );
  }

  Widget _buildPatientsList(List<Patient> patients) {
    return SliverList.separated(
      itemCount: patients.length,
      itemBuilder: (context, index) {
        final patient = patients[index];
        return InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  patient.name,
                  style: CustomTextTheme.header1TextStyle,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: Sizes.gapSizes.size8),
    );
  }
}
