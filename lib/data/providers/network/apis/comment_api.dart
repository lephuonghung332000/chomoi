import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/data/dto/request/comment/comment_request_dto.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';
import 'dart:convert';

enum CommentType { fetchComment, addComment }

class CommentAPI implements APIRequestRepresentable {
  final CommentType type;
  final String? postId;
  final int? page;
  final CommentRequestDto? commentRequestDto;

  CommentAPI._({
    required this.type,
    this.postId,
    this.page,
    this.commentRequestDto,
  });

  CommentAPI.fetchComment({String? postId, int? page})
      : this._(
          type: CommentType.fetchComment,
          postId: postId,
          page: page,
        );

  CommentAPI.addComment({
    required CommentRequestDto commentRequestDto,
  }) : this._(
          type: CommentType.addComment,
          commentRequestDto: commentRequestDto,
        );

  @override
  String get endpoint => 'comment';

  @override
  String get path {
    switch (type) {
      case CommentType.fetchComment:
        return '/$postId';
      case CommentType.addComment:
        return '/addComment';
    }
  }

  @override
  Map<String, String> get headers {
    return {};
  }

  @override
  Map<String, String>? get query {
    switch (type) {
      case CommentType.fetchComment:
        return {
          'page': '$page',
        };
      case CommentType.addComment:
        return null;
    }
  }

  @override
  String? get body {
    switch (type) {
      case CommentType.addComment:
        return jsonEncode(commentRequestDto?.toJson());
      case CommentType.fetchComment:
        return null;
    }
  }

  @override
  Future request() {
    switch (type) {
      case CommentType.fetchComment:
        return APIProvider.instance.get(this);
      case CommentType.addComment:
        return APIProvider.instance.post(this);
    }
  }

  @override
  String get url => endpoint + path;
}
