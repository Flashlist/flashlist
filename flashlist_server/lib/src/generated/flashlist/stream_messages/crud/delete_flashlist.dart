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

abstract class DeleteFlashlist
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DeleteFlashlist._({required this.flashlistId});

  factory DeleteFlashlist({required int flashlistId}) = _DeleteFlashlistImpl;

  factory DeleteFlashlist.fromJson(Map<String, dynamic> jsonSerialization) {
    return DeleteFlashlist(
        flashlistId: jsonSerialization['flashlistId'] as int);
  }

  int flashlistId;

  /// Returns a shallow copy of this [DeleteFlashlist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DeleteFlashlist copyWith({int? flashlistId});
  @override
  Map<String, dynamic> toJson() {
    return {'flashlistId': flashlistId};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'flashlistId': flashlistId};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DeleteFlashlistImpl extends DeleteFlashlist {
  _DeleteFlashlistImpl({required int flashlistId})
      : super._(flashlistId: flashlistId);

  /// Returns a shallow copy of this [DeleteFlashlist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DeleteFlashlist copyWith({int? flashlistId}) {
    return DeleteFlashlist(flashlistId: flashlistId ?? this.flashlistId);
  }
}
