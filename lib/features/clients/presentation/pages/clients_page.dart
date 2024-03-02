import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/core/injectable/injectable_config.dart';
import 'package:fizjoaktive/core/utils/debouncer.dart';
import 'package:fizjoaktive/features/client/presentation/bloc/client_bloc.dart';
import 'package:fizjoaktive/features/clients/presentation/bloc/clients_bloc.dart';
import 'package:fizjoaktive/features/clients/presentation/widgets/clients_list_item.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:fizjoaktive/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/navigator/app_router.dart';
import '../../domain/models/client.dart';

@RoutePage()
class ClientsPage extends HookWidget {
  final searchDebouncer = Debouncer(delay: const Duration(milliseconds: 500));

  ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Klienci")),
      body: BlocConsumer<ClientsBloc, ClientsState>(
        bloc: getIt<ClientsBloc>()..add(InitClients()),
        builder: (context, state) {
          return Column(
            children: [
              _buildSearchBar(searchController),
              if (state is ClientsLoading)
                const Center(child: CircularProgressIndicator()),
              if (state is ClientsLoaded)
                _buildLoadedClients(context, state.clients),
            ],
          );
        },
        listener: (BuildContext context, ClientsState state) {
          _onNavigateToClient(state, searchController.text);
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
            getIt<ClientsBloc>().add(ClientSearch(value));
          });
        },
      ),
    );
  }

  Widget _buildLoadedClients(BuildContext context, List<Client> clients) {
    return Flexible(
      child: ListView.separated(
        itemCount: clients.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ClientsListItem(client: clients[index]);
        },
        separatorBuilder: (_, __) => Divider(
          indent: Sizes.gapSizes.size16,
          endIndent: Sizes.gapSizes.size16,
        ),
      ),
    );
  }

  Future<void> _onNavigateToClient(
      ClientsState state, String searchQuery) async {
    if (state is! PushClientPage) return;
    try {
      await getIt<AppNavigator>().navigateToClientPage(state.client);
      getIt<ClientsBloc>().add(ClientSearch(searchQuery));
    } catch (e) {
      print(e);
    }
  }
}
