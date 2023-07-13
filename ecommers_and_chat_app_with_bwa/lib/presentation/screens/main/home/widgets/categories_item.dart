import 'package:ecommers_and_chat_app_with_bwa/presentation/providers/categories_state.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesItem extends ConsumerWidget {
  const CategoriesItem({
    super.key,
    required this.onTap,
    required this.text,
    required this.index,
    required this.length,
  });
  final VoidCallback onTap;
  final String text;
  final int index, length;
  @override
  Widget build(BuildContext context, ref) {
    final isSelected = ref.watch(categoriesStateProvider) == index;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        margin: EdgeInsets.only(
          left: index == 0 ? BoxSize.size30 : 0,
          right: index == length - 1 ? BoxSize.size30 : BoxSize.size16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: isSelected ? AppStyle.purple : null,
          borderRadius: BorderRadius.circular(BoxSize.radius12),
          border: Border.all(
            color: AppStyle.darkGrey30,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyle.poppinsMedium.copyWith(
                fontSize: 13,
                color: !isSelected ? AppStyle.darkGrey30 : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
