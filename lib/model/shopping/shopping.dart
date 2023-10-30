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
    @JsonKey(name: 'dueDateTime') DateTime? due,
    DateTime? created,
    DateTime? updated
  }) = _Shopping;

  const Shopping._();
  
  factory Shopping.fromJson(Map<String, Object?> json)
      => _$ShoppingFromJson(json);
}

// public int Id { get; set; }
//         public string Name { get; set; }
//         public DateTime? DueDateTime { get; set; }
//         public string? Description { get; set; }
//         public int CreatorId { get; set; }
//         public DateTime Created { get; set; }
//         public DateTime Updated { get; set; }