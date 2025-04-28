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
import '../../flashlist_item/flashlist_item.dart' as _i2;

abstract class InsertFlashlistItem implements _i1.SerializableModel {
  InsertFlashlistItem._({required this.item});

  factory InsertFlashlistItem({required _i2.FlashlistItem item}) =
      _InsertFlashlistItemImpl;

  factory InsertFlashlistItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return InsertFlashlistItem(
        item: _i2.FlashlistItem.fromJson(
            (jsonSerialization['item'] as Map<String, dynamic>)));
  }

  _i2.FlashlistItem item;

  /// Returns a shallow copy of this [InsertFlashlistItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  InsertFlashlistItem copyWith({_i2.FlashlistItem? item});
  @override
  Map<String, dynamic> toJson() {
    return {'item': item.toJson()};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _InsertFlashlistItemImpl extends InsertFlashlistItem {
  _InsertFlashlistItemImpl({required _i2.FlashlistItem item})
      : super._(item: item);

  /// Returns a shallow copy of this [InsertFlashlistItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  InsertFlashlistItem copyWith({_i2.FlashlistItem? item}) {
    return InsertFlashlistItem(item: item ?? this.item.copyWith());
  }
}
