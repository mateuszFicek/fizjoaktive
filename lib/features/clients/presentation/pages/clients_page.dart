import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/core/utils/date_utils.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:fizjoaktive/theme/text_theme.dart';
import 'package:fizjoaktive/widgets/text_input.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Klienci")),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(Sizes.gapSizes.size16),
          child: TextInput(
            controller: TextEditingController(),
            labelText: "Szukaj...",
          ),
        ),
        Flexible(
          child: ListView.separated(
            itemCount: 16,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
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
                            "Agnieszka Bąk",
                            style: CustomTextTheme.header1BoldTextStyle,
                          ),
                          Text(
                            "Liczba pacjentów: 7",
                            style: CustomTextTheme.header2TextStyle,
                          ),
                          Text(
                            "Ostatnia wizyta: ${DateTime.now().fullDateAndHour}",
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
            },
            separatorBuilder: (_, __) => Divider(
              indent: Sizes.gapSizes.size16,
              endIndent: Sizes.gapSizes.size16,
            ),
          ),
        ),
      ],
    );
  }
}
