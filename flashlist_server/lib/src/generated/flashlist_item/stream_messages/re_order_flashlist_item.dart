/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class ReOrderFlashlistItem
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ReOrderFlashlistItem._({
    required this.id,
    required this.parentId,
    required this.oldOrderNr,
    this.newOrderNr,
  });

  factory ReOrderFlashlistItem({
    required int id,
    required int parentId,
    required int oldOrderNr,
    int? newOrderNr,
  }) = _ReOrderFlashlistItemImpl;

  factory ReOrderFlashlistItem.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ReOrderFlashlistItem(
      id: jsonSerialization['id'] as int,
      parentId: jsonSerialization['parentId'] as int,
      oldOrderNr: jsonSerialization['oldOrderNr'] as int,
      newOrderNr: jsonSerialization['newOrderNr'] as int?,
    );
  }

  int id;

  int parentId;

  int oldOrderNr;

  int? newOrderNr;

  /// Returns a shallow copy of this [ReOrderFlashlistItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReOrderFlashlistItem copyWith({
    int? id,
    int? parentId,
    int? oldOrderNr,
    int? newOrderNr,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parentId': parentId,
      'oldOrderNr': oldOrderNr,
      if (newOrderNr != null) 'newOrderNr': newOrderNr,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'parentId': parentId,
      'oldOrderNr': oldOrderNr,
      if (newOrderNr != null) 'newOrderNr': newOrderNr,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReOrderFlashlistItemImpl extends ReOrderFlashlistItem {
  _ReOrderFlashlistItemImpl({
    required int id,
    required int parentId,
    required int oldOrderNr,
    int? newOrderNr,
  }) : super._(
          id: id,
          parentId: parentId,
          oldOrderNr: oldOrderNr,
          newOrderNr: newOrderNr,
        );

  /// Returns a shallow copy of this [ReOrderFlashlistItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReOrderFlashlistItem copyWith({
    int? id,
    int? parentId,
    int? oldOrderNr,
    Object? newOrderNr = _Undefined,
  }) {
    return ReOrderFlashlistItem(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      oldOrderNr: oldOrderNr ?? this.oldOrderNr,
      newOrderNr: newOrderNr is int? ? newOrderNr : this.newOrderNr,
    );
  }
}
