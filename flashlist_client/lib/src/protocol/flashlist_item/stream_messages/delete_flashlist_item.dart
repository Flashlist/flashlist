/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class DeleteFlashlistItem extends _i1.SerializableEntity {
  DeleteFlashlistItem._({
    required this.id,
    required this.parentId,
  });

  factory DeleteFlashlistItem({
    required int id,
    required int parentId,
  }) = _DeleteFlashlistItemImpl;

  factory DeleteFlashlistItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return DeleteFlashlistItem(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      parentId:
          serializationManager.deserialize<int>(jsonSerialization['parentId']),
    );
  }

  int id;

  int parentId;

  DeleteFlashlistItem copyWith({
    int? id,
    int? parentId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parentId': parentId,
    };
  }
}

class _DeleteFlashlistItemImpl extends DeleteFlashlistItem {
  _DeleteFlashlistItemImpl({
    required int id,
    required int parentId,
  }) : super._(
          id: id,
          parentId: parentId,
        );

  @override
  DeleteFlashlistItem copyWith({
    int? id,
    int? parentId,
  }) {
    return DeleteFlashlistItem(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
    );
  }
}
