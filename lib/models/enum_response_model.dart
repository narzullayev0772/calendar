import 'package:flutter/material.dart';

class EnumResponse {
  final List<EnumModel> enums;

  EnumResponse({required this.enums});

  factory EnumResponse.fromJson(List response) {
    return EnumResponse(
      enums: response.map((e) => EnumModel.fromJson(e)).toList(),
    );
  }
}

class EnumModel {
  final int type;
  final String color;

  EnumModel({
    required this.type,
    required this.color,
  });

  factory EnumModel.fromJson(Map<String, dynamic> json) {
    return EnumModel(
      type: json['type'],
      color: json['color'],
    );
  }

  Color get colorValue {
    // parse hex color
    final hexColor = color.replaceAll('#', 'FF');
    return Color(int.parse(hexColor, radix: 16));
  }
}
