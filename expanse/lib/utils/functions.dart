import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

/// Pick file in device
/// if file isSelected returned [File]
/// if pick file cancel returned [null]
Future<File?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result == null && result?.files == []) return null;
  return File(result!.files.first.path!);
}

/// Pick image from camera and gallery
/// if image isSelected returned [File]
/// if pick image cancel returned [null]
Future<File?> pickImage(ImageSource pickFrom) async {
  final returnedImage = await ImagePicker().pickImage(source: pickFrom);

  if (returnedImage == null) return null;
  return File(returnedImage.path);
}
