import 'dart:convert';

class Answer {
  final int id;
  final String inisial;
  final String jawaban;
  final bool isCorrect;
  final int nilai;

  Answer({
    required this.id,
    required this.inisial,
    required this.jawaban,
    required this.isCorrect,
    required this.nilai,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    print('Answer JSON: ${jsonEncode(json)}'); // Tambahkan logging di sini
    return Answer(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      inisial: json['inisial'],
      jawaban: json['jawaban'],
      isCorrect: json['iscorrect'] == '1',
      nilai: json['nilai'] is String ? int.parse(json['nilai']) : json['nilai'],
    );
  }
}

class Question {
  final int id;
  final String noSoal;
  final String soal;
  final List<Answer> options;

  Question({
    required this.id,
    required this.noSoal,
    required this.soal,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    print('Question JSON: ${jsonEncode(json)}'); // Tambahkan logging di sini
    var optionsList = json['tryout_question_option'] as List;
    List<Answer> options = optionsList.map((option) => Answer.fromJson(option)).toList();

    return Question(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      noSoal: json['no_soal'],
      soal: json['soal'],
      options: options,
    );
  }
}
