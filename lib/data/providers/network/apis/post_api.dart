import 'package:chomoi/data/dto/request/post/post_request_dto.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';
import 'package:dio/dio.dart';

enum PostType { fetchPost, addPost }

class PostAPI implements APIRequestRepresentable {
  final PostType type;
  int? page;
  String? status;
  String? timePost;
  String? categoryId;
  String? province;
  String? search;
  String? userId;
  final PostRequestDto? postRequestDto;

  PostAPI._({
    required this.type,
    this.status,
    this.timePost,
    this.categoryId,
    this.province,
    this.search,
    this.page,
    this.postRequestDto,
    this.userId,
  });

  PostAPI.fetchPost({
    String? status,
    int? page,
    String? timePost,
    String? categoryId,
    String? province,
    String? search,
    String? userId,
  }) : this._(
          type: PostType.fetchPost,
          page: page,
          status: status,
          timePost: timePost,
          categoryId: categoryId,
          province: province,
          search: search,
          userId: userId,
        );

  PostAPI.addPost({
    required PostRequestDto postRequestDto,
  }) : this._(
          type: PostType.addPost,
          postRequestDto: postRequestDto,
        );

  @override
  String get endpoint => 'post';

  @override
  String get path {
    switch (type) {
      case PostType.fetchPost:
        return userId != null ? '/$userId' : '';
      case PostType.addPost:
        return '/addPost';
    }
  }

  @override
  Map<String, String> get headers {
    return {};
  }

  @override
  Map<String, String>? get query {
    switch (type) {
      case PostType.fetchPost:
        final Map<String, String> queryPost = {};
        if (page != null) {
          queryPost['page'] = '$page';
        }
        if (status != null) {
          queryPost['status'] = '$status';
        }
        if (timePost != null) {
          queryPost['create_at'] = '$timePost';
        }
        if (categoryId != null) {
          queryPost['category_id'] = '$categoryId';
        }
        if (province != null) {
          queryPost['province'] = '$province';
        }
        if (search != null) {
          queryPost['search'] = '$search';
        }
        return queryPost;
      case PostType.addPost:
        return null;
    }
  }

  @override
  dynamic get body {
    switch (type) {
      case PostType.addPost:
        return FormData.fromMap(postRequestDto!.toJson());
      default:
        return null;
    }
  }

  @override
  Future request() {
    switch (type) {
      case PostType.addPost:
        return APIProvider.instance.post(this);
      default:
        return APIProvider.instance.get(this);
    }
  }

  @override
  String get url => endpoint + path;
}
