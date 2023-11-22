import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_product_assignment_state.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class AddProductAssignmentState with _$AddProductAssignmentState {
  const factory AddProductAssignmentState({
    String? productName,
    int? quantity,
  }) = _AddProductAssignmentState;

  factory AddProductAssignmentState.empty() =>
      const AddProductAssignmentState();

  bool get canCreateAssignment =>
      productName != null &&
      quantity != null &&
      quantity! >= 0;

  const AddProductAssignmentState._();
}
