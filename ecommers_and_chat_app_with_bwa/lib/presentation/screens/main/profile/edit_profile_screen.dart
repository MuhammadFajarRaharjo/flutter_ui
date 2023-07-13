import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/custom_appbar.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/custom_text_field.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/width_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController nameCont, usernameCont, emailCont;

  @override
  void initState() {
    super.initState();
    nameCont = TextEditingController();
    usernameCont = TextEditingController();
    emailCont = TextEditingController();
  }

  @override
  void dispose() {
    nameCont.dispose();
    usernameCont.dispose();
    emailCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
          child: Column(
            children: [
              HeightSpacer.from30(),

              //* IMAGE PROFILE
              const CircleAvatar(
                radius: 50,
                backgroundColor: AppStyle.darkGrey39,
                backgroundImage: AssetImage(Assets.assetsImagesUserProfile),
              ),

              //* TEXT FIELD NAME
              HeightSpacer.from20(),
              CustomTextField(
                controller: nameCont,
                title: 'Name',
                hintText: 'Inpur your name',
              ),
              //* TEXT FIELD USERNAME
              HeightSpacer.from20(),
              CustomTextField(
                controller: usernameCont,
                title: 'Username',
                hintText: 'Inpur your username',
              ),
              //* TEXT FIELD EMAIL
              HeightSpacer.from20(),
              CustomTextField(
                controller: emailCont,
                title: 'Email',
                hintText: 'Inpur your Email',
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomAppBar _appBar() {
    return CustomAppBar(
      title: const Text('Edit Profile'),
      centerTitle: true,
      backButton: true,
      onPressed: () => Navigator.pop(context),
      iconBack: Icons.close_sharp,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.check,
            color: AppStyle.purple,
          ),
        ),
        WidthSpacer.from10(),
      ],
    );
  }
}
