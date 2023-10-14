import 'dart:convert';

import 'package:test_in_action/app/json/base/json_field.dart';
import 'package:test_in_action/app/json/quiz_entity.g.dart';

export 'package:test_in_action/app/json/quiz_entity.g.dart';

@JsonSerializable()
class QuizEntity {
  int? id;
  int? rightCount;
  int? wrongCount;
  String? question;
  String? verified;
  String? answer;
  List<QuizOptions>? options;

  QuizEntity();

  factory QuizEntity.fromJson(Map<String, dynamic> json) =>
      $QuizEntityFromJson(json);

  Map<String, dynamic> toJson() => $QuizEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class QuizOptions {
  String? option;
  String? value;

  QuizOptions();

  factory QuizOptions.fromJson(Map<String, dynamic> json) =>
      $QuizOptionsFromJson(json);

  Map<String, dynamic> toJson() => $QuizOptionsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
