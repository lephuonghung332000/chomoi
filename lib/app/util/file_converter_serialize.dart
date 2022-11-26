import 'dart:io';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

class FileConverterSerialize
    implements JsonConverter<MultipartFile, MultipartFile> {
  const FileConverterSerialize();

  @override
  MultipartFile fromJson(MultipartFile json) {
    return MultipartFile(Stream.fromIterable([]), 0);
  }

  @override
  MultipartFile toJson(MultipartFile multipartFile) {
    return multipartFile;
  }
}
