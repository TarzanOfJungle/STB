import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String? description,
    required int creatorId,
    DateTime? created,
    DateTime? updated
  }) = _Product;

  const Product._();
  
  factory Product.fromJson(Map<String, Object?> json)
      => _$ProductFromJson(json);
}