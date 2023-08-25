import 'package:expanse/presentation/routes/app_routes.dart';
import 'package:expanse/presentation/widgets/height_spacer.dart';
import 'package:expanse/utils/constants/assets.dart';
import 'package:flutter/material.dart';

class SetupSuccessPage extends StatelessWidget {
  const SetupSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, AppRoutes.main);
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.assetsImagesSuccess,
                height: 128,
              ),
              HeightSPacer.from10(),
              const Text('You are set!', style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
