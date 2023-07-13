import 'package:flutter/material.dart';
import 'package:home_rent/common/constants/my_colors.dart';
import 'package:home_rent/common/styles/app_styles.dart';
import 'package:home_rent/common/styles/box_style.dart';
import 'package:home_rent/common/styles/font_styles.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  });
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // duration: const Duration(milliseconds: 50),
        padding: const EdgeInsets.symmetric(
          horizontal: BoxStyle.padding16,
          vertical: BoxStyle.padding10,
        ),
        margin: const EdgeInsets.only(left: BoxStyle.padding20, bottom: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BoxStyle.borderRadius10),
          gradient: isSelected ? AppStyles.linearGradientBlue : null,
          color: !isSelected ? MyColors.whiteF7 : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.4),
                    blurRadius: 5,
                    spreadRadius: -4,
                    offset: const Offset(0, 6),
                  )
                ]
              : null,
        ),
        child: Text(
          text,
          style: FontStyles.ralewayMedium12.copyWith(
            color: isSelected ? Colors.white : MyColors.grey85,
          ),
        ),
        // child: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     splashFactory: InkSplash.splashFactory,
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: BoxStyle.padding16,
        //       vertical: BoxStyle.padding10,
        //     ),
        //     shadowColor: Colors.transparent,
        //     elevation: 0,
        //     alignment: Alignment.center,
        //     backgroundColor: Colors.transparent,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(BoxStyle.borderRadius10),
        //     ),
        //   ),
        //   onPressed: () {},
        //   child: Text(
        //     text,
        //     style: FontStyles.ralewayMedium12.copyWith(color: MyColors.white),
        //   ),
        // ),
      ),
    );
  }
}
