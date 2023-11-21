import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_shopping.freezed.dart';
part 'post_shopping.g.dart';

/// DTO for posting a new shopping
@freezed
class PostShopping with _$PostShopping {
  const factory PostShopping({
    required String name,
    DateTime? dueDateTime,
    String? description,
  }) = _PostShopping;

  const PostShopping._();
  
  factory PostShopping.fromJson(Map<String, Object?> json)
      => _$PostShoppingFromJson(json);
}