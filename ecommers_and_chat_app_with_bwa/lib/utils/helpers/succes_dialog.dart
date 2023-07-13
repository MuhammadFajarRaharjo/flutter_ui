import 'package:ecommers_and_chat_app_with_bwa/presentation/routes/route_name.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';

void showSuccessDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppStyle.darkNavy24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BoxSize.radius30),
      ),
      elevation: 0,
      content: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),

          //* Gunakan heightFactory dan mainAxisSize
          //* agar tingginya menyesuaikan dengan konten
          Align(
            alignment: Alignment.topCenter,
            heightFactor: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.assetsImagesSuccess,
                  height: 100,
                ),
                HeightSpacer.from10(),
                Text(
                  'Hurray :)',
                  textAlign: TextAlign.center,
                  style: AppStyle.poppinsSemiBold.copyWith(fontSize: 18),
                ),
                HeightSpacer.from5(),
                Text(
                  'Item added successfully',
                  textAlign: TextAlign.center,
                  style: AppStyle.poppinsRegular
                      .copyWith(fontSize: 14, color: AppStyle.grey99),
                ),
                HeightSpacer.from10(),
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteName.chart,
                      (route) => route.isFirst,
                    );
                  },
                  child: const Text('View My Chart'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
