import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/core/injectable/injectable_config.dart';
import 'package:fizjoaktive/core/navigator/app_router.dart';
import 'package:fizjoaktive/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:fizjoaktive/theme/text_theme.dart';
import 'package:fizjoaktive/widgets/custom_button.dart';
import 'package:fizjoaktive/widgets/full_screen_loading_indicator.dart';
import 'package:fizjoaktive/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

@RoutePage()
class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: _body()),
    );
  }

  Widget _body() {
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    final ValueNotifier<bool> obscureText = useState(true);
    final FocusNode passwordFocusNode = useFocusNode();
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: getIt<AuthenticationBloc>(),
      builder: (context, state) {
        return FullScreenLoadingWrapper(
          showLoadingIndicator: state is AuthenticationProcessing,
          child: Padding(
            padding: EdgeInsets.all(Sizes.spacingSizes.size16),
            child: authenticationBody(
              context,
              emailController,
              passwordFocusNode,
              passwordController,
              obscureText,
            ),
          ),
        );
      },
      listener: (BuildContext context, AuthenticationState state) {
        onAuthenticationFailure(state, context);
        onAuthenticationSuccess(state, context);
      },
    );
  }

  ListView authenticationBody(
      BuildContext context,
      TextEditingController emailController,
      FocusNode passwordFocusNode,
      TextEditingController passwordController,
      ValueNotifier<bool> obscureText) {
    return ListView(
      children: [
        _titleSection(),
        Gap(MediaQuery.of(context).size.height / 8),
        _emailInput(emailController, passwordFocusNode),
        Gap(Sizes.gapSizes.size16),
        _passwordInput(
          passwordController,
          emailController,
          obscureText,
          passwordFocusNode,
        ),
        Gap(MediaQuery.of(context).size.height / 8),
        _proceedButton(emailController.text, passwordController.text),
        Gap(Sizes.gapSizes.size16),
      ],
    );
  }

  void onAuthenticationFailure(state, context) {
    if (state is AuthenticationFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  }

  void onAuthenticationSuccess(state, context) {
    if (state is AuthenticationSuccess) {
      getIt<AppNavigator>().navigateHome();
    }
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

  Widget _emailInput(
    TextEditingController emailController,
    FocusNode passwordFocusNode,
  ) {
    return TextInput(
      textInputType: TextInputType.emailAddress,
      labelText: "Adres email",
      controller: emailController,
      onEditingComplete: () {
        passwordFocusNode.requestFocus();
      },
    );
  }

  Widget _passwordInput(
    TextEditingController passwordController,
    TextEditingController emailController,
    ValueNotifier<bool> obscureText,
    FocusNode passwordFocusNode,
  ) {
    return TextInput(
      obscureText: obscureText.value,
      labelText: "Hasło",
      controller: passwordController,
      focusNode: passwordFocusNode,
      onEditingComplete: () {
        getIt<AuthenticationBloc>().add(
          PerformLogin(emailController.text, passwordController.text),
        );
        FocusManager.instance.primaryFocus?.unfocus();
      },
      togglePasswordObscure: () {
        obscureText.value = !obscureText.value;
      },
    );
  }

  Widget _proceedButton(String email, String password) {
    return CustomButton(
      text: "Zaloguj",
      onPressed: () {
        getIt<AuthenticationBloc>().add(
          PerformLogin(email, password),
        );
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
