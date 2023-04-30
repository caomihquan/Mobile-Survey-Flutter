part of 'question_bloc.dart';

class QuestionState {
  const QuestionState({this.ListQuestion = const []});
  final List<JsonQuestionModel> ListQuestion;

  QuestionState copyWith({List<JsonQuestionModel>? ListQuestion}) {
    return QuestionState(
      ListQuestion: ListQuestion ?? this.ListQuestion,
    );
  }
}
