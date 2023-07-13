import 'package:ecommers_and_chat_app_with_bwa/presentation/providers/pc_overflow_state.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/screens/main/chat/widgets/chat_bouble.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/screens/main/chat/widgets/product_card_chat.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/custom_appbar.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/width_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/product_card_overflow.dart';

class ChatRoom extends ConsumerWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isProductVisible =
        ref.watch(pCOverflowVisibleStateProvider(key: const Key('store1')));
    return Scaffold(
      appBar: _appbar(context),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
              children: const [
                ProductCardChat(),
                ChatBouble(),
                ChatBouble(isSender: false),
                ChatBouble(isSender: false),
                ChatBouble(),
                ProductCardChat(isSender: false),
                ChatBouble(),
              ],
            ),
          ),
          _inputBoxAndProductCardOverflow(isProductVisible),
        ],
      ),
    );
  }

  Padding _inputBoxAndProductCardOverflow(bool isVisible) {
    return Padding(
      padding: const EdgeInsets.all(BoxSize.size20).copyWith(top: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: isVisible,
            child: const ProductCardOverflow(),
          ),
          HeightSpacer.from20(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //* INPUT BOX
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(BoxSize.radius12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppStyle.darkNavy25,
                    hintText: 'Type Message',
                    hintStyle: AppStyle.poppinsRegularSecondary.copyWith(
                      fontSize: 14,
                    ),
                    isDense: true,
                  ),
                  style: AppStyle.poppinsRegular.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  maxLines: null,
                ),
              ),
              WidthSpacer.from10(),

              //* BOTTON SEND
              IconButton.filledTonal(
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BoxSize.radius12),
                  ),
                  backgroundColor: AppStyle.purple,
                  fixedSize: const Size(50, 50),
                ),
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return CustomAppBar(
      centerTitle: false,
      backButton: true,
      onPressed: () => Navigator.pop(context),
      title: Row(
        children: [
          const Badge(
            // jika ingin menghilnagkan badge rubah laargeSize menjadi 0
            largeSize: 20,
            padding: EdgeInsets.all(3),
            alignment: Alignment.bottomRight,
            offset: Offset(3, 3),
            backgroundColor: AppStyle.darkNavy1F,
            label: CircleAvatar(
              backgroundColor: AppStyle.green51,
              radius: 7,
            ),
            child: CircleAvatar(
              backgroundColor: AppStyle.darkNavy1F,
              backgroundImage: AssetImage(Assets.assetsImagesShopLogo),
              radius: 25,
            ),
          ),
          WidthSpacer.from20(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shoe Store',
                style: AppStyle.poppinsMedium,
              ),
              HeightSpacer.from5(),
              Text(
                'Online',
                style: AppStyle.poppinsLight.copyWith(
                  color: const Color(0xFF999999),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
