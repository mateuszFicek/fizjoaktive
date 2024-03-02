import 'package:fizjoaktive/core/injectable/injectable_config.dart';
import 'package:fizjoaktive/core/utils/date_utils.dart';
import 'package:fizjoaktive/features/clients/presentation/bloc/clients_bloc.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:flutter/material.dart';

import '../../../../theme/text_theme.dart';
import '../../domain/models/client.dart';

class ClientsListItem extends StatelessWidget {
  const ClientsListItem({
    super.key,
    required this.client,
  });

  final Client client;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<ClientsBloc>().add(NavigateToClient(client));
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
                  client.name,
                  style: CustomTextTheme.header1BoldTextStyle,
                ),
                Text(
                  "Liczba pacjentów: ${client.patientsIDs.length}",
                  style: CustomTextTheme.header2TextStyle,
                ),
                Text(
                  "Ostatnia wizyta: ${client.lastVisit.fullDateAndHour}",
                  style: CustomTextTheme.header3TextStyle,
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
