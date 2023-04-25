import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/survey/QuestionType/TextQuestion.dart';
import 'package:pokedex/ui/screens/survey/detail/question.dart';
import '../../ui/screens/survey/model/modelAnswer.dart';
import '../../ui/screens/survey/model/modelQuestion.dart';

class A1point5 extends StatefulWidget {
  final Function fnChangeAnswerQuiz;
  const A1point5(this.fnChangeAnswerQuiz, {super.key});

  @override
  State<A1point5> createState() => _A1point5State();
}

class _A1point5State extends State<A1point5> {
  final List<ModelQuestion> _questions = [
    ModelQuestion(QuestionID: 1, QuestionName: 'Họ và tên', AnswerResult: "", Answers: []),
    ModelQuestion(QuestionID: 2, QuestionName: 'Giới tính', AnswerResult: "", Answers: [
      ModelAnswer(AnswerID: 1, AnswerName: 'Nam'),
      ModelAnswer(AnswerID: 2, AnswerName: 'Nữ'),
    ]),
    ModelQuestion(QuestionID: 3, QuestionName: 'Dân tộc', AnswerResult: "", Answers: []),
    ModelQuestion(QuestionID: 4, QuestionName: 'Quốc tịch', AnswerResult: "", Answers: [
      ModelAnswer(AnswerID: 1, AnswerName: 'Việt Nam'),
      ModelAnswer(AnswerID: 2, AnswerName: 'Nước ngoài'),
    ]),
    ModelQuestion(
        QuestionID: 4,
        QuestionName: 'Trình độ chuyên môn (Theo bằng/giấy chứng nhận trình độ cao nhất hiện có):',
        AnswerResult: "",
        Answers: [
          ModelAnswer(AnswerID: 1, AnswerName: 'Chưa qua đào tạo'),
          ModelAnswer(AnswerID: 2, AnswerName: 'Đào tạo dưới 3 tháng'),
          ModelAnswer(AnswerID: 3, AnswerName: 'Sơ cấp'),
          ModelAnswer(AnswerID: 4, AnswerName: 'Trung cấp'),
          ModelAnswer(AnswerID: 5, AnswerName: 'Cao đẳng'),
          ModelAnswer(AnswerID: 6, AnswerName: 'Đại học'),
          ModelAnswer(AnswerID: 7, AnswerName: 'Thạc sỹ'),
          ModelAnswer(AnswerID: 8, AnswerName: 'Tiến sỹ'),
          ModelAnswer(AnswerID: 9, AnswerName: 'Trình độ khác (ghi rõ):')
        ]),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextQuestion(_questions, 0, widget.fnChangeAnswerQuiz),
      Question(_questions, 1, widget.fnChangeAnswerQuiz),
      TextQuestion(_questions, 2, widget.fnChangeAnswerQuiz),
      Question(_questions, 3, widget.fnChangeAnswerQuiz),
      Question(_questions, 4, widget.fnChangeAnswerQuiz, isOther: true),
    ]);
  }
}
