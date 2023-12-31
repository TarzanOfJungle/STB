import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping.freezed.dart';
part 'shopping.g.dart';

@freezed
class Shopping with _$Shopping {
  const factory Shopping({
    required int id,
    required String name,
    required int creatorId,
    String? description,
    required bool finalized,
    @JsonKey(name: 'dueDateTime') DateTime? due,
    DateTime? created,
    DateTime? updated,
  }) = _Shopping;

  const Shopping._();

  factory Shopping.fromJson(Map<String, Object?> json) =>
      _$ShoppingFromJson(json);
}
