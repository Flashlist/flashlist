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
import '../flashlist_item/flashlist_item.dart' as _i2;
import '../user/app_user.dart' as _i3;

abstract class Flashlist implements _i1.SerializableModel {
  Flashlist._({
    this.id,
    required this.uuid,
    required this.title,
    required this.color,
    this.items,
    this.authors,
    this.isCollapsed,
    required this.createdAt,
    this.updatedAt,
  });

  factory Flashlist({
    int? id,
    required String uuid,
    required String title,
    required String color,
    List<_i2.FlashlistItem?>? items,
    List<_i3.AppUser?>? authors,
    bool? isCollapsed,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _FlashlistImpl;

  factory Flashlist.fromJson(Map<String, dynamic> jsonSerialization) {
    return Flashlist(
      id: jsonSerialization['id'] as int?,
      uuid: jsonSerialization['uuid'] as String,
      title: jsonSerialization['title'] as String,
      color: jsonSerialization['color'] as String,
      items: (jsonSerialization['items'] as List?)
          ?.map((e) => e == null
              ? null
              : _i2.FlashlistItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      authors: (jsonSerialization['authors'] as List?)
          ?.map((e) => e == null
              ? null
              : _i3.AppUser.fromJson((e as Map<String, dynamic>)))
          .toList(),
      isCollapsed: jsonSerialization['isCollapsed'] as bool?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String uuid;

  String title;

  String color;

  List<_i2.FlashlistItem?>? items;

  List<_i3.AppUser?>? authors;

  bool? isCollapsed;

  DateTime createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [Flashlist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Flashlist copyWith({
    int? id,
    String? uuid,
    String? title,
    String? color,
    List<_i2.FlashlistItem?>? items,
    List<_i3.AppUser?>? authors,
    bool? isCollapsed,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uuid': uuid,
      'title': title,
      'color': color,
      if (items != null)
        'items': items?.toJson(valueToJson: (v) => v?.toJson()),
      if (authors != null)
        'authors': authors?.toJson(valueToJson: (v) => v?.toJson()),
      if (isCollapsed != null) 'isCollapsed': isCollapsed,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FlashlistImpl extends Flashlist {
  _FlashlistImpl({
    int? id,
    required String uuid,
    required String title,
    required String color,
    List<_i2.FlashlistItem?>? items,
    List<_i3.AppUser?>? authors,
    bool? isCollapsed,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          uuid: uuid,
          title: title,
          color: color,
          items: items,
          authors: authors,
          isCollapsed: isCollapsed,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Flashlist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Flashlist copyWith({
    Object? id = _Undefined,
    String? uuid,
    String? title,
    String? color,
    Object? items = _Undefined,
    Object? authors = _Undefined,
    Object? isCollapsed = _Undefined,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return Flashlist(
      id: id is int? ? id : this.id,
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      color: color ?? this.color,
      items: items is List<_i2.FlashlistItem?>?
          ? items
          : this.items?.map((e0) => e0?.copyWith()).toList(),
      authors: authors is List<_i3.AppUser?>?
          ? authors
          : this.authors?.map((e0) => e0?.copyWith()).toList(),
      isCollapsed: isCollapsed is bool? ? isCollapsed : this.isCollapsed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
