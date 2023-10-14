import 'dart:convert';

/// question : "\"根据ISO 9000标准的定义，“质量\"\"是指“客体的一组固有特性满足要求的程度”，以下（）不属于产品的 “固有特性”。 \""
/// options : [{"option":"A","value":"选项1"},{"option":"B","value":"选项2"},{"option":"C","value":"选项3"},{"option":"D","value":"选项4"},{"option":"E","value":"选项5"}]
/// answer : "C"
/// verified : 1
/// id : 1

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));
String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  Quiz({
    this.question,
    this.options,
    this.answer,
    this.verified,
    this.id,
    this.rightCount,
    this.wrongCount,
  });

  Quiz.fromJson(dynamic json) {
    question = json['question'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Options.fromJson(v));
      });
    }
    answer = json['answer'];
    verified = json['verified'];
    id = json['id'];
    rightCount = json['rightCount'];
    wrongCount = json['wrongCount'];
  }
  String? question;
  List<Options>? options;
  String? answer;
  String? verified;
  num? id;
  num? rightCount;
  num? wrongCount;
  Quiz copyWith({
    String? question,
    List<Options>? options,
    String? answer,
    String? verified,
    num? id,
    num? rightCount,
    num? wrongCount,
  }) =>
      Quiz(
        question: question ?? this.question,
        options: options ?? this.options,
        answer: answer ?? this.answer,
        verified: verified ?? this.verified,
        id: id ?? this.id,
        rightCount: rightCount ?? this.rightCount,
        wrongCount: wrongCount ?? this.wrongCount,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = question;
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
    map['answer'] = answer;
    map['verified'] = verified;
    map['id'] = id;
    map['rightCount'] = rightCount;
    map['wrongCount'] = wrongCount;
    return map;
  }
}

/// option : "A"
/// value : "选项1"

Options optionsFromJson(String str) => Options.fromJson(json.decode(str));
String optionsToJson(Options data) => json.encode(data.toJson());

class Options {
  Options({
    this.option,
    this.value,
  });

  Options.fromJson(dynamic json) {
    option = json['option'];
    value = json['value'];
  }
  String? option;
  String? value;
  Options copyWith({
    String? option,
    String? value,
  }) =>
      Options(
        option: option ?? this.option,
        value: value ?? this.value,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['option'] = option;
    map['value'] = value;
    return map;
  }
}
