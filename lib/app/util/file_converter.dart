import 'dart:io';

import 'package:dio/dio.dart';

extension Multipart on File {
  Future<MultipartFile> get toMultipart =>
      MultipartFile.fromFile(path, filename: path);
}
