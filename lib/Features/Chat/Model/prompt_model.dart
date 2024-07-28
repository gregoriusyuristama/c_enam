import 'package:flutter/material.dart';

class PromptModel {
  String? title;
  String? subtitle;
  Color? cardStartColor;
  Color? cardEndColor;

  PromptModel({
    required this.title,
    required this.subtitle,
    required this.cardStartColor,
    required this.cardEndColor,
  });
}
