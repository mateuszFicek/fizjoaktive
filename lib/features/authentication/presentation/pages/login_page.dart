import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/core/injectable/injectable_config.dart';
import 'package:fizjoaktive/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:fizjoaktive/theme/text_theme.dart';
import 'package:fizjoaktive/widgets/custom_button.dart';
import 'package:fizjoaktive/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.all(Sizes.spacingSizes.size16),
      child: Column(
        children: [
          const Spacer(),
          _titleSection(),
          const Spacer(),
          _emailInput(),
          Gap(Sizes.gapSizes.size16),
          _passwordInput(),
          const Spacer(),
          _proceedButton(),
          Gap(Sizes.gapSizes.size16),
        ],
      ),
    );
  }

  Widget _titleSection() {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FizjoAktive",
              style: CustomTextTheme.titleTextStyle,
            ),
            Gap(Sizes.gapSizes.size4),
            const Text("Zaloguj się do systemu"),
          ],
        ),
      ),
    );
  }

  Widget _emailInput() {
    return const TextInput(
      textInputType: TextInputType.emailAddress,
      labelText: "Adres email",
    );
  }

  Widget _passwordInput() {
    return const TextInput(
      obscureText: true,
      labelText: "Hasło",
    );
  }

  Widget _proceedButton() {
    return CustomButton(
      text: "Zaloguj",
      onPressed: () {
        getIt<AuthenticationBloc>().add(
          PerformLogin("test@google.com", "test1234"),
        );
      },
    );
  }
}
