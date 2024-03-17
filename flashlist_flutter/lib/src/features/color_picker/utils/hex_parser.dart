import 'package:flutter/material.dart';

/// Parses a [Color] into a hexadecimal string like: '#ffff0000'
String parseIntoHexString(Color color) {
  return '#${color.alpha.toRadixString(16).padLeft(2, '0')}${color.red.toRadixString(16).padLeft(2, '0')}${color.green.toRadixString(16).padLeft(2, '0')}${color.blue.toRadixString(16).padLeft(2, '0')}';
}

/// Parses a [Color] into a readable hexadecimal string like: '#ffffff'
String parseIntoReadableHexString(Color color) {
  return '#${color.red.toRadixString(16).padLeft(2, '0')}${color.green.toRadixString(16).padLeft(2, '0')}${color.blue.toRadixString(16).padLeft(2, '0')}';
}
