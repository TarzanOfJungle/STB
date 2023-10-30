import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_product.freezed.dart';
part 'post_product.g.dart';

/// DTO for posting new product
@freezed
class PostProduct with _$PostProduct {
  const factory PostProduct({
    required String name,
    required String description,
  }) = _PostProduct;

  const PostProduct._();
  
  factory PostProduct.fromJson(Map<String, Object?> json)
      => _$PostProductFromJson(json);
}