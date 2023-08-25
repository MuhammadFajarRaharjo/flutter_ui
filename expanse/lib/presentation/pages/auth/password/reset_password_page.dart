import 'package:expanse/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/constant.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/height_spacer.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Reset Password'),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultMargin),
        child: ListView(
          children: [
            //* TEXT FORM FIELD
            const HeightSPacer(height: 40),
            const CustomTextFormField(
              hint: 'New Password',
              isPasswordType: true,
            ),
            HeightSPacer.from20(),
            const CustomTextFormField(
              hint: 'Retype new Password',
              isPasswordType: true,
            ),

            //* BUTTON LOGIN
            HeightSPacer.from30(),
            CustomFilledButton(
              text: 'Continue',
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.main,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
