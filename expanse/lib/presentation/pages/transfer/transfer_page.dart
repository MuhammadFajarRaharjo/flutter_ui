import 'dart:io';

import 'package:expanse/presentation/routes/app_routes.dart';
import 'package:expanse/presentation/widgets/custom_bottom_sheet.dart';
import 'package:expanse/presentation/widgets/width_spacer.dart';
import 'package:expanse/utils/enum/app_file_type.dart';
import 'package:expanse/utils/extensions/file_extension.dart';
import 'package:expanse/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant.dart';
import '../../../utils/utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_filled_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/height_spacer.dart';
import '../../widgets/icon_utton_bms.dart';
import '../../widgets/svg_asset.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage>
    with WidgetsBindingObserver {
  late final TextEditingController _controller;
  File? selectedFile;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    if (selectedFile != null) {
      selectedFile!.delete();
    }
    super.dispose();
  }

  //* Untuk mendengarkan perubahan dimensi pada layar
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    //* mendengarkan perubahan tampilan pada bagian bawah
    if (MediaQuery.viewInsetsOf(context).bottom != 0) {
      FocusScope.of(context).unfocus();
    }
  }

  //* Function pick image from camera and gallery
  Future<void> _pickImage(ImageSource pickFrom) async {
    final file = await pickImage(pickFrom);

    setState(() => selectedFile = file);
  }

  //* Function pick File from folder
  Future<void> _pickFile() async {
    final file = await pickFile();
    setState(() => selectedFile = file);
  }

  //* delete file from cache
  Future<void> _deleteFile() async {
    await selectedFile?.delete().then((value) => selectedFile = null);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kBlue,
        appBar: const CustomAppBar(
          title: 'Transfer',
          foregroundColor: kWhite80,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _infoBalance(),
            _bottomSeed(context),
          ],
        ),
      ),
    );
  }

  Padding _infoBalance() {
    return Padding(
      padding: const EdgeInsets.all(kDefaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How Much?',
            style: TextStyle(color: kWhite80.withOpacity(0.64), fontSize: 18),
          ),
          const Text(
            '\$0',
            style: TextStyle(fontSize: 64, color: kWhite80),
          ),
        ],
      ),
    );
  }

  Widget _bottomSeed(BuildContext context) {
    return CustomButtomSheet(
      padding: const EdgeInsets.all(kDefaultMargin),
      children: [
        //* TEXTFIELD CATEGORY
        Stack(
          children: [
            Row(
              children: [
                Flexible(
                  child: CustomTextFormField(
                      controller: _controller, hint: 'From'),
                ),
                WidthSpacer.from10(),
                Flexible(
                  child:
                      CustomTextFormField(controller: _controller, hint: 'To'),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: kWhite80,
                    side: const BorderSide(color: kWhite60, width: 2),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(23),
                  ),
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.assetsIconsTransaction,
                  ),
                ),
              ),
            ),
          ],
        ),

        //* TEXTFIELD DESCRIPTION
        HeightSPacer.from20(),
        const CustomTextFormField(hint: 'Description'),

        //* IMAGE AND BUTTON ADD IMAGE
        HeightSPacer.from10(),
        selectedFile != null
            ? Align(
                alignment: Alignment.topLeft,
                child: selectedFile!.fileType() == AppFileType.image
                    ? _cardImage()
                    : _cardFile(),
              )
            : _buttonAddAtachment(context),

        //* BUTTON CONTINUE
        // HeightSPacer.from10(),
        CustomFilledButton(
          text: 'Continue',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                elevation: 0,
                backgroundColor: kWhite80,
                titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                icon: const SvgAsset(Assets.assetsIconsSuccess),
                title: const Text('Transaction has been successfully added'),
              ),
            ).then(
              (value) => Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.main,
                (route) => false,
              ),
            );
          },
        ),
      ],
    );
  }

  TextButton _buttonAddAtachment(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: kTextSecondary,
        textStyle:
            Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
      ),
      onPressed: () => showAppModalBottomSheet(
        context: context,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //* ICON BUTTON CAMERA
            IconButtonBMS(
              asset: Assets.assetsIconsCamera,
              text: 'Camera',
              onTap: () => _pickImage(ImageSource.camera),
            ),

            //* ICON BUTTON GALLERY
            IconButtonBMS(
              asset: Assets.assetsIconsGallery,
              text: 'Gallery',
              onTap: () => _pickImage(ImageSource.gallery),
            ),

            //* ICON BUTTON DOCUMENTS
            IconButtonBMS(
              asset: Assets.assetsIconsFile,
              text: 'File',
              onTap: _pickFile,
            ),
          ],
        ),
      ),
      icon: const SvgAsset(
        Assets.assetsIconsAttachment,
        color: kTextSecondary,
      ),
      label: const Text('Add atachment'),
    );
  }

  SizedBox _cardImage() {
    return SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultRadius),
              image: DecorationImage(
                image: FileImage(selectedFile!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              height: 24,
              width: 24,
              child: IconButton.filled(
                color: Colors.white,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.32),
                ),
                onPressed: _deleteFile,
                icon: const Icon(Icons.close),
                iconSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _cardFile() {
    return SizedBox(
      height: 80,
      width: 70,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SvgAsset(
                Assets.assetsIconsFile,
                height: 60,
                width: 60,
              ),
              Text(
                selectedFile!.path.split('/').last,
                style: const TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              height: 24,
              width: 24,
              child: IconButton.filled(
                color: Colors.white,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.32),
                ),
                onPressed: _deleteFile,
                icon: const Icon(Icons.close),
                iconSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
