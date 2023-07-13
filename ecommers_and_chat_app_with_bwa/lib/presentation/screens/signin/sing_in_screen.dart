import 'package:ecommers_and_chat_app_with_bwa/presentation/routes/route_name.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/custom_text_field.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/box_size.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController emailCont;
  late final TextEditingController passCont;

  @override
  void initState() {
    super.initState();
    emailCont = TextEditingController();
    passCont = TextEditingController();
  }

  @override
  void dispose() {
    emailCont.dispose();
    passCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(BoxSize.size30).copyWith(bottom: 0),
        child: ListView(
          children: [
            Text(
              'Login',
              style:
                  AppStyle.poppinsSemiBold.copyWith(fontSize: BoxSize.size24),
            ),
            HeightSpacer.from5(),
            Text(
              'Sign In to Countinue',
              style: AppStyle.poppinsRegularSecondary.copyWith(fontSize: 14),
            ),

            //* Text Form
            const HeightSpacer(height: 70),
            CustomTextField(
              controller: emailCont,
              title: 'Email Address',
              hintText: 'Your email address',
              svg: Assets.assetsSvgMail,
            ),
            HeightSpacer.from20(),
            CustomTextField(
              isPassword: true,
              controller: passCont,
              title: 'Password',
              hintText: 'Your password',
              svg: Assets.assetsSvgLock,
            ),
            HeightSpacer.from30(),
            FilledButton(
              onPressed: () {},
              child: const Text('Sign In'),
            ),
            HeightSpacer(height: BoxSize.proportionalHeight(context, 28)),

            //* Footer
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already have an account? ',
                style: AppStyle.poppinsRegular.copyWith(
                  color: AppStyle.grey50,
                  fontSize: 12,
                ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: AppStyle.poppinsRegular.copyWith(
                      color: AppStyle.purple,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => Navigator.pushNamed(context, RouteName.signUp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
