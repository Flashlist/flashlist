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

abstract class UpdateFlashlist implements _i1.SerializableModel {
  UpdateFlashlist._({
    required this.id,
    this.title,
    this.color,
  });

  factory UpdateFlashlist({
    required int id,
    String? title,
    String? color,
  }) = _UpdateFlashlistImpl;

  factory UpdateFlashlist.fromJson(Map<String, dynamic> jsonSerialization) {
    return UpdateFlashlist(
      id: jsonSerialization['id'] as int,
      title: jsonSerialization['title'] as String?,
      color: jsonSerialization['color'] as String?,
    );
  }

  int id;

  String? title;

  String? color;

  UpdateFlashlist copyWith({
    int? id,
    String? title,
    String? color,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (title != null) 'title': title,
      if (color != null) 'color': color,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UpdateFlashlistImpl extends UpdateFlashlist {
  _UpdateFlashlistImpl({
    required int id,
    String? title,
    String? color,
  }) : super._(
          id: id,
          title: title,
          color: color,
        );

  @override
  UpdateFlashlist copyWith({
    int? id,
    Object? title = _Undefined,
    Object? color = _Undefined,
  }) {
    return UpdateFlashlist(
      id: id ?? this.id,
      title: title is String? ? title : this.title,
      color: color is String? ? color : this.color,
    );
  }
}
