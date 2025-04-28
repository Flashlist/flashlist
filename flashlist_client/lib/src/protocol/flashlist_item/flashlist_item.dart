/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class FlashlistItem implements _i1.SerializableModel {
  FlashlistItem._({
    this.id,
    required this.name,
    required this.parentId,
    required this.orderNr,
  });

  factory FlashlistItem({
    int? id,
    required String name,
    required int parentId,
    required int orderNr,
  }) = _FlashlistItemImpl;

  factory FlashlistItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return FlashlistItem(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      parentId: jsonSerialization['parentId'] as int,
      orderNr: jsonSerialization['orderNr'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int parentId;

  int orderNr;

  /// Returns a shallow copy of this [FlashlistItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FlashlistItem copyWith({
    int? id,
    String? name,
    int? parentId,
    int? orderNr,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'parentId': parentId,
      'orderNr': orderNr,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FlashlistItemImpl extends FlashlistItem {
  _FlashlistItemImpl({
    int? id,
    required String name,
    required int parentId,
    required int orderNr,
  }) : super._(
          id: id,
          name: name,
          parentId: parentId,
          orderNr: orderNr,
        );

  /// Returns a shallow copy of this [FlashlistItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FlashlistItem copyWith({
    Object? id = _Undefined,
    String? name,
    int? parentId,
    int? orderNr,
  }) {
    return FlashlistItem(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      orderNr: orderNr ?? this.orderNr,
    );
  }
}
