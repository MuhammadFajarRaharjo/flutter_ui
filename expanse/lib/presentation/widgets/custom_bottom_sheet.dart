import 'package:flutter/material.dart';

class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet({super.key, this.children = const [], this.padding});
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      clipBehavior: Clip.antiAlias,
      enableDrag: false,
      onClosing: () {},
      constraints: BoxConstraints(
        //* batasi tinggi agar tidak overload pixel
        maxHeight: MediaQuery.sizeOf(context).height * 0.7,
      ),

      //* Gunakan SingleChildScrollView dibandingkan ListView
      //* agar maxHeight dan minHeight bekerja dengan baik
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
