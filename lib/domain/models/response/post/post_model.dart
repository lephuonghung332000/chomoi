import 'package:chomoi/data/dto/response/post/post_paging_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    required String id,
    required String userId,
    required String categoryId,
    required String title,
    required double createAt,
    required double updateAt,
    required String status,
    required String brandId,
    required List<String> images,
    required String address,
    required int price,
    required String description,
    required String avatar,
    required String name,
    required String phone,
    required double dateJoin,
    required String email,
  }) = _PostModel;

  factory PostModel.empty() => PostModel(
        id: '',
        userId: '',
        categoryId: '',
        title: '',
        createAt: -1,
        updateAt: -1,
        status: '',
        brandId: '',
        images: [],
        address: '',
        price: -1,
        description: '',
        avatar: '',
        name: '',
        phone: '',
        dateJoin: -1,
        email: '',
      );

  static List<PostModel> fromDto(PostPagingDto dto) {
    return List<PostModel>.from(
      dto.data.map<PostModel>(
        (e) => PostModel(
          updateAt: e.updateAt,
          description: e.description,
          createAt: e.createAt,
          brandId: e.brandId,
          categoryId: e.categoryId,
          price: e.price,
          id: e.id,
          userId: e.userId,
          images: e.images,
          title: e.title,
          address: e.address,
          status: e.status,
          avatar: e.avatar,
          dateJoin: e.dateJoin,
          name: e.name,
          phone: e.phone,
          email: e.email,
        ),
      ),
    );
  }
}
