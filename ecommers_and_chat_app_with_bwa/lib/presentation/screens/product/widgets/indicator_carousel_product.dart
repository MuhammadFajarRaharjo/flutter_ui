import 'package:ecommers_and_chat_app_with_bwa/presentation/providers/indicator_carousel_product_state.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndicatorCarouselProduct extends ConsumerWidget {
  const IndicatorCarouselProduct(this.count, {super.key});
  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carouselSelected = ref.watch(indicatorCarouselProductStateProvider);
    return Container(
      height: BoxSize.size10,
      margin: EdgeInsets.only(
        bottom: BoxSize.proportionalHeight(context, 7),
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => AnimatedContainer(
          margin:
              EdgeInsets.only(right: index != (count - 1) ? BoxSize.size5 : 0),
          duration: const Duration(milliseconds: 250),
          width: carouselSelected == index ? BoxSize.size24 : BoxSize.size10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BoxSize.radius12),
            color:
                carouselSelected == index ? AppStyle.purple : AppStyle.greyB7,
          ),
        ),
      ),
    );
  }
}
