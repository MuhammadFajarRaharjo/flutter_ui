import 'dart:io';

import 'package:expanse/utils/enum/app_file_type.dart';
import 'package:mime/mime.dart';

extension FileExtension on File {
  AppFileType? fileType() {
    final mimeType = lookupMimeType(path);
    switch (mimeType?.split('/').first) {
      case 'image':
        return AppFileType.image;
      case 'file':
        return AppFileType.file;
      case 'video':
        return AppFileType.video;
    }
    return null;
  }
}
