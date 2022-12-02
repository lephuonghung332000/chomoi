
import 'package:freezed_annotation/freezed_annotation.dart';

enum NotificationType{
  @JsonValue('post pending') post_pending,
  @JsonValue('post accept') post_accept,
  @JsonValue('post pending') post_reject,
  @JsonValue('ads') ads,
}
