/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class FlashlistBatch
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  FlashlistBatch._({required this.collection});

  factory FlashlistBatch({required List<_i2.Flashlist> collection}) =
      _FlashlistBatchImpl;

  factory FlashlistBatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return FlashlistBatch(
        collection: (jsonSerialization['collection'] as List)
            .map((e) => _i2.Flashlist.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.Flashlist> collection;

  FlashlistBatch copyWith({List<_i2.Flashlist>? collection});
  @override
  Map<String, dynamic> toJson() {
    return {'collection': collection.toJson(valueToJson: (v) => v.toJson())};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'collection': collection.toJson(valueToJson: (v) => v.toJsonForProtocol())
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _FlashlistBatchImpl extends FlashlistBatch {
  _FlashlistBatchImpl({required List<_i2.Flashlist> collection})
      : super._(collection: collection);

  @override
  FlashlistBatch copyWith({List<_i2.Flashlist>? collection}) {
    return FlashlistBatch(collection: collection ?? this.collection.clone());
  }
}
