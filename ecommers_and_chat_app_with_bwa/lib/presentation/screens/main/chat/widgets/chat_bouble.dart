import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';

class ChatBouble extends StatelessWidget {
  const ChatBouble({super.key, this.isSender = true});
  final bool isSender;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          //! Masih harus di perbaiki marginnya, agar tidak selalu 12
          margin: const EdgeInsets.only(top: BoxSize.size12),
          padding: const EdgeInsets.all(BoxSize.size12),
          width: BoxSize.proportionalWidth(context, 65),
          decoration: BoxDecoration(
            color: isSender
                ? AppStyle.purple.withOpacity(0.24)
                : AppStyle.darkNavy25,
            borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(BoxSize.radius12))
                .copyWith(
              topLeft: isSender
                  ? const Radius.circular(BoxSize.radius12)
                  : Radius.zero,
              topRight: isSender
                  ? Radius.zero
                  : const Radius.circular(BoxSize.radius12),
            ),
          ),
          child: Text(
            'Hi, This item is still available?',
            style: AppStyle.poppinsRegular.copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
