import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/box_size.dart';
import '../../../utils/style/app_style.dart';
import '../../routes/route_name.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/height_spacer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController nameCont;
  late final TextEditingController usernameCont;
  late final TextEditingController emailCont;
  late final TextEditingController passCont;

  @override
  void initState() {
    super.initState();
    nameCont = TextEditingController();
    usernameCont = TextEditingController();
    emailCont = TextEditingController();
    passCont = TextEditingController();
  }

  @override
  void dispose() {
    nameCont.dispose();
    usernameCont.dispose();
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
              'Sign Up',
              style:
                  AppStyle.poppinsSemiBold.copyWith(fontSize: BoxSize.size24),
            ),
            HeightSpacer.from5(),
            Text(
              'Register and Happy Shoping',
              style: AppStyle.poppinsRegularSecondary.copyWith(fontSize: 14),
            ),

            //* Text Form
            const HeightSpacer(height: 50),
            CustomTextField(
              controller: nameCont,
              title: 'Full Name',
              hintText: 'Your email address',
              svg: Assets.assetsSvgPerson,
            ),
            HeightSpacer.from20(),
            CustomTextField(
              controller: usernameCont,
              title: 'Username',
              hintText: 'Your email address',
              svg: Assets.assetsSvgUsername,
            ),
            HeightSpacer.from20(),
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
              child: const Text('Sign Up'),
            ),

            //* Footer
            HeightSpacer.from20(),
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
                    text: 'Sign In',
                    style: AppStyle.poppinsRegular.copyWith(
                      color: AppStyle.purple,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => Navigator.pushNamed(context, RouteName.signIn),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
