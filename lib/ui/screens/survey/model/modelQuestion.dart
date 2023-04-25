import 'package:pokedex/ui/screens/survey/model/modelAnswer.dart';

class ModelQuestion {
  int QuestionID;
  String QuestionName;
  int? QuestionType;
  dynamic AnswerResult;
  List<ModelAnswer> Answers;

  ModelQuestion(
      {required this.QuestionID,
      required this.QuestionName,
      this.QuestionType,
      required this.AnswerResult,
      required this.Answers});
}
