import 'package:ecommers_and_chat_app_with_bwa/presentation/routes/route_name.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/custom_appbar.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:flutter/material.dart';

import '../../../widgets/empty_contain.dart';
import 'widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Message Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => ChatTile(
            onTap: () => Navigator.pushNamed(context, RouteName.chatRoom),
          ),
        ),
      ),
    );
  }

  //* Digunakan nanti pada saat chat kosong
  Widget _emptyChat() {
    return const EmptyContain(
      imageAsset: Assets.assetsImagesHeadset,
      title: 'Opss no message yet?',
      subtitle: 'You have never done a transaction',
    );
  }
}
