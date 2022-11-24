
import 'dart:io';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

class FileListConverter implements JsonConverter<File?, MultipartFile> {
  const FileListConverter();

  @override
  File? fromJson(MultipartFile json) {
    return null;
  }

  @override
  MultipartFile toJson(File? file) {
    return MultipartFile(file, filename: file?.path ?? '');
  }
}