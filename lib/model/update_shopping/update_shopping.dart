import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_shopping.freezed.dart';
part 'update_shopping.g.dart';

/// DTO for updating a shopping with PUT
/// If you want to update due and/or description,
/// updateDue and/or updateDescription must be set to true
/// and due and/or description can't be null
@freezed
class UpdateShopping with _$UpdateShopping {
  const factory UpdateShopping({
    required int id,
    String? name,
    @Default(false) @JsonKey(name: 'updateDueDateTime') bool updateDue,
    @JsonKey(name: 'dueDateTime') DateTime? due,
    @Default(false) bool updateDescription,
    String? description,
  }) = _UpdateShopping;

  const UpdateShopping._();
  
  factory UpdateShopping.fromJson(Map<String, Object?> json)
      => _$UpdateShoppingFromJson(json);
}