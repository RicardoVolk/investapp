import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/models/transaction_model.dart';
import 'package:financy_app/common/themes/default_theme.dart';
import 'package:financy_app/features/forgot_password/check_your_email_page.dart';
import 'package:financy_app/features/forgot_password/forgot_password_page.dart';
import 'package:financy_app/features/home/home_page_view.dart';
import 'package:financy_app/features/profile/profile_page.dart';
import 'package:financy_app/features/sign_in/sign_in_page.dart';
import 'package:financy_app/features/sign_up/sign_up_page.dart';
import 'package:financy_app/features/splash/splash_page.dart';
import 'package:financy_app/features/stats/stats_page.dart';
import 'package:financy_app/features/transactions/transaction_page.dart';
import 'package:financy_app/features/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

import 'features/onboarding/onboarding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().defaultTheme,
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnboardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => const SignUpPage(),
        NamedRoute.signIn: (context) => const SignInPage(),
        NamedRoute.home: (context) => const HomePageView(),
        NamedRoute.stats: (context) => const StatsPage(),
        NamedRoute.wallet: (context) => const WalletPage(),
        NamedRoute.profile: (context) => const ProfilePage(),
        NamedRoute.transaction: (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          return TransactionPage(
            transaction: args != null ? args as TransactionModel : null,
          );
        },
        NamedRoute.forgotPassword: (context) => const ForgotPasswordPage(),
        NamedRoute.checkYourEmail: (context) => const CheckYourEmailPage(),
      },
    );
  }
}
