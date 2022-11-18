// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_paging_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostPagingDto _$PostPagingDtoFromJson(Map<String, dynamic> json) =>
    PostPagingDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => PostData.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
    );

Map<String, dynamic> _$PostPagingDtoToJson(PostPagingDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'total': instance.total,
      'data': instance.data,
    };

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      categoryId: json['category_id'] as String,
      title: json['title'] as String,
      createAt: (json['create_at'] as num).toDouble(),
      updateAt: (json['update_at'] as num).toDouble(),
      brandId: json['brand_id'] as String,
      status: json['status'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as int,
      description: json['description'] as String,
      address: json['address'] as String,
      avatar: json['avatar'] as String,
      dateJoin: (json['date_join'] as num).toDouble(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_id': instance.categoryId,
      'title': instance.title,
      'create_at': instance.createAt,
      'update_at': instance.updateAt,
      'brand_id': instance.brandId,
      'status': instance.status,
      'images': instance.images,
      'price': instance.price,
      'description': instance.description,
      'address': instance.address,
      'avatar': instance.avatar,
      'date_join': instance.dateJoin,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
    };
