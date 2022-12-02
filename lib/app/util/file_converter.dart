import 'dart:io';

import 'package:dio/dio.dart';

extension Multipart on File {
  Future<MultipartFile> get toMultipart =>
      MultipartFile.fromFile(path, filename: path);
  Future<MultipartFile> get toMultipartFromUrl =>
      MultipartFile.fromFile(path, filename: path);
}
