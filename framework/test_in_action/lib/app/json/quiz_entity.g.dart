import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/quiz_entity.dart';
import 'package:test_in_action/app/json/base/json_convert_content.dart';

QuizEntity $QuizEntityFromJson(Map<String, dynamic> json) {
  final QuizEntity quizEntity = QuizEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    quizEntity.id = id;
  }
  final int? rightCount = jsonConvert.convert<int>(json['rightCount']);
  if (rightCount != null) {
    quizEntity.rightCount = rightCount;
  }
  final int? wrongCount = jsonConvert.convert<int>(json['wrongCount']);
  if (wrongCount != null) {
    quizEntity.wrongCount = wrongCount;
  }
  final String? question = jsonConvert.convert<String>(json['question']);
  if (question != null) {
    quizEntity.question = question;
  }
  final String? verified = jsonConvert.convert<String>(json['verified']);
  if (verified != null) {
    quizEntity.verified = verified;
  }
  final String? answer = jsonConvert.convert<String>(json['answer']);
  if (answer != null) {
    quizEntity.answer = answer;
  }
  final List<QuizOptions>? options = (json['options'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<QuizOptions>(e) as QuizOptions)
      .toList();
  if (options != null) {
    quizEntity.options = options;
  }
  return quizEntity;
}

Map<String, dynamic> $QuizEntityToJson(QuizEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['rightCount'] = entity.rightCount;
  data['wrongCount'] = entity.wrongCount;
  data['question'] = entity.question;
  data['verified'] = entity.verified;
  data['answer'] = entity.answer;
  data['options'] = entity.options?.map((v) => v.toJson()).toList();
  return data;
}

extension QuizEntityExtension on QuizEntity {
  QuizEntity copyWith({
    int? id,
    int? rightCount,
    int? wrongCount,
    String? question,
    String? verified,
    String? answer,
    List<QuizOptions>? options,
  }) {
    return QuizEntity()
      ..id = id ?? this.id
      ..rightCount = rightCount ?? this.rightCount
      ..wrongCount = wrongCount ?? this.wrongCount
      ..question = question ?? this.question
      ..verified = verified ?? this.verified
      ..answer = answer ?? this.answer
      ..options = options ?? this.options;
  }
}

QuizOptions $QuizOptionsFromJson(Map<String, dynamic> json) {
  final QuizOptions quizOptions = QuizOptions();
  final String? option = jsonConvert.convert<String>(json['option']);
  if (option != null) {
    quizOptions.option = option;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    quizOptions.value = value;
  }
  return quizOptions;
}

Map<String, dynamic> $QuizOptionsToJson(QuizOptions entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['option'] = entity.option;
  data['value'] = entity.value;
  return data;
}

extension QuizOptionsExtension on QuizOptions {
  QuizOptions copyWith({
    String? option,
    String? value,
  }) {
    return QuizOptions()
      ..option = option ?? this.option
      ..value = value ?? this.value;
  }
}
