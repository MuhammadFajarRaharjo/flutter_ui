import 'package:expanse/utils/constants/constant.dart';
import 'package:expanse/presentation/routes/app_routes.dart';
import 'package:expanse/presentation/widgets/custom_app_bar.dart';
import 'package:expanse/presentation/widgets/custom_filled_button.dart';
import 'package:expanse/presentation/widgets/custom_text_form_field.dart';
import 'package:expanse/presentation/widgets/height_spacer.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultMargin),
        child: ListView(
          children: [
            const HeightSPacer(height: 40),
            Text(
              'Don’t worry.\nEnter your email and we’ll send you a link to reset your password.',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24),
            ),
            HeightSPacer.from30(),
            const CustomTextFormField(
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            HeightSPacer.from20(),
            CustomFilledButton(
              text: 'Continue',
              onPressed: () => Navigator.pushReplacementNamed(
                context,
                AppRoutes.successSendToEmail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
