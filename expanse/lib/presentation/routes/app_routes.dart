import 'package:expanse/presentation/pages/auth/login/login_page.dart';
import 'package:expanse/presentation/pages/auth/password/forgot_password_page.dart';
import 'package:expanse/presentation/pages/auth/password/reset_password_page.dart';
import 'package:expanse/presentation/pages/auth/password/success_send_to_email_page.dart';
import 'package:expanse/presentation/pages/auth/signup/signup_page.dart';
import 'package:expanse/presentation/pages/auth/verification/verfication_page.dart';
import 'package:expanse/presentation/pages/expanse/expanse_page.dart';
import 'package:expanse/presentation/pages/financial_report/financial_report_page.dart';
import 'package:expanse/presentation/pages/income/income_page.dart';
import 'package:expanse/presentation/pages/main_page.dart';
import 'package:expanse/presentation/pages/onboarding/onboarding_page.dart';
import 'package:expanse/presentation/pages/onboarding/setup_account_page.dart';
import 'package:expanse/presentation/pages/onboarding/setup_pin_page.dart';
import 'package:expanse/presentation/pages/splashScreen/splash_screen.page.dart';
import 'package:expanse/presentation/pages/transaction/transaction_page.dart';
import 'package:expanse/presentation/pages/transfer/transfer_page.dart';
import 'package:flutter/material.dart';

import '../pages/financial_report/financial_report_detail_page.dart';
import '../pages/onboarding/add_new_account_page.dart';
import '../pages/onboarding/setup_success_page.dart';

class AppRoutes {
  static const splashScreen = '/splashScreen';

  //* ONBOARDING
  static const onboarding = '/onboarding';
  static const setupPin = '/setupPin';
  static const setupAccount = '/setupAccount';
  static const addNewAccount = '/addNewAccount';
  static const setupSuccess = '/setupSuccess';

  //* MAIN
  static const main = '/main';
  static const expanse = '/expanse';
  static const income = '/income';
  static const transfer = '/transfer';
  static const transaction = '/transaction';
  static const financialReport = '/financialReport';
  static const financialReportDetail = '/financialReportDetail';

  //* AUTH
  static const login = '/login';
  static const signUp = '/signUp';
  static const verification = '/verification';
  static const resetPassword = '/resetPassword';
  static const forgotPassword = '/forgotPassword';
  static const successSendToEmail = '/successSendToEmail';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      //* MAIN
      case main:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case expanse:
        return MaterialPageRoute(builder: (_) => const ExpansePage());
      case income:
        return MaterialPageRoute(builder: (_) => const IncomePage());
      case transfer:
        return MaterialPageRoute(builder: (_) => const TransferPage());
      case transaction:
        return MaterialPageRoute(builder: (_) => const TransactionPage());
      case financialReport:
        return MaterialPageRoute(builder: (_) => const FinancialReportPage());
      case financialReportDetail:
        return MaterialPageRoute(
          builder: (_) => const FinancialReportDetailPage(),
        );

      //* ONBOARDING
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case setupPin:
        return MaterialPageRoute(builder: (_) => const SetupPinPage());
      case setupAccount:
        return MaterialPageRoute(builder: (_) => const SetupAccountPage());
      case addNewAccount:
        return MaterialPageRoute(builder: (_) => const AddNewAccountPage());
      case setupSuccess:
        return MaterialPageRoute(builder: (_) => const SetupSuccessPage());

      //* AUTH
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case verification:
        return MaterialPageRoute(builder: (_) => const VerificationPage());
      case resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordPage());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case successSendToEmail:
        return MaterialPageRoute(
          builder: (_) => const SuccessSendToEmailPage(),
        );

      default:
        return _wrongPage();
    }
  }

  static Route<dynamic> _wrongPage() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text('Wrong Page')),
      ),
    );
  }
}
