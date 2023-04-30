part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent {}

class GetQuestion extends QuestionEvent {}

class SetQuestion extends QuestionEvent {
  SetQuestion(this.questions);
  final List<JsonQuestionModel> questions;
}

class RemoveUser extends QuestionEvent {}
