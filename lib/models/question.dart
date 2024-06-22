class Question {
  final int id;
  final String text;
  final int? nextQuestionId;
  final int? nextFalseQuestionId;
  final RepairAdvice? repairAdvice;

  Question({
    required this.id,
    required this.text,
    this.nextQuestionId,
    this.nextFalseQuestionId,
    this.repairAdvice,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      text: json['text'],
      nextQuestionId: json['nextQuestion'],
      nextFalseQuestionId: json['nextFalseQuestion'],
      repairAdvice: json['repairAdvice'] != null
          ? RepairAdvice.fromJson(json['repairAdvice'])
          : null,
    );
  }
}

class RepairAdvice {
  final int id;
  final String damage;
  final String advice;

  RepairAdvice({
    required this.id,
    required this.damage,
    required this.advice,
  });

  factory RepairAdvice.fromJson(Map<String, dynamic> json) {
    return RepairAdvice(
      id: json['id'],
      damage: json['damage'],
      advice: json['advice'],
    );
  }
}
