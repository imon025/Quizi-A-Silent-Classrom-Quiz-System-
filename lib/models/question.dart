class Question {
  String question;
  List<String> options;
  int answerIndex; // Correct answer

  Question({
    required this.question,
    required this.options,
    required this.answerIndex,
  });

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'options': options,
      'answerIndex': answerIndex,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] ?? '',
      options: List<String>.from(map['options'] ?? []),
      answerIndex: map['answerIndex'] ?? 0,
    );
  }
}
