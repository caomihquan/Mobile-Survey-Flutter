import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/model/JsonQuestionModel.dart';
import 'package:pokedex/states/bloc/question_responsitory.dart';

import '../../Database.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(QuestionState()) {
    on<GetQuestion>(_handleStoreQuestion);
    on<SetQuestion>(_handleSetQuestion);
  }

  final StoreResponsitory data = StoreResponsitory();

  Future<void> _handleStoreQuestion(GetQuestion event, Emitter<QuestionState> emit) async {
    final response = await data.readJson();
    List<JsonQuestionModel> dataSql = await DBProvider.getQuestions();
    print(jsonEncode(dataSql));
    for (var answer in dataSql) {
      for (var i = 0; i < response.length; i++) {
        if (response[i].questionID == answer.questionID) {
          response[i].answerResult = answer.answerResult;
          break;
        }
      }
    }
    emit(state.copyWith(ListQuestion: response));
  }

  Future<void> _handleSetQuestion(
    SetQuestion event,
    Emitter<QuestionState> emit,
  ) async {
    emit(state.copyWith(
      ListQuestion: event.questions,
    ));
  }
}
