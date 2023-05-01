import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/Database.dart';
import 'package:pokedex/states/bloc/question_bloc.dart';
import 'package:pokedex/ui/screens/survey/detail/quiz.dart';
import '../../../../model/JsonQuestionModel.dart';
import '../../../widgets/alert.dart';

class SurveyDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SurveyDetailScreenState();
}

class _SurveyDetailScreenState extends State<SurveyDetail> {
  var questionIndex = 0;
  var totalItem = 0;

  void fnQuestionsIndex(type, JsonQuestionModel data, List<JsonQuestionModel> list) {
    if ((data.answerResult == "" || data.answerResult == null) &&
        type != 1 &&
        data.validType != null) {
      return showAlert.show(context, 'error', 'Thông báo', 'Vui lòng trả lời câu hỏi');
    }
    if (data.answerResult != "" && data.validType == 1 && data.answerResult == "") {
      return showAlert.show(context, 'error', 'Thông báo', 'Vui lòng trả lời câu hỏi');
    } else if (data.answerResult != "" && data.validType == 2) {
      var answerResult = list.firstWhere((element) => element.questionID == "SL015").answerResult;
      if (int.parse(data.answerResult) > int.parse(answerResult)) {
        return showAlert.show(context, 'error', 'Thông báo',
            'Vui lòng nhập bằng hoặc nhỏ hơn số người lao động của cơ sở');
      }
    } else if (data.answerResult != "" && data.validType == 3) {
      var answerResult = list.firstWhere((element) => element.questionID == "SL015").answerResult;
      if (int.parse(data.answerResult) >= int.parse(answerResult)) {
        return showAlert.show(
            context, 'error', 'Thông báo', 'Vui lòng nhập nhỏ hơn số người lao động của cơ sở');
      }
    }
    context.read<QuestionBloc>().add(SetQuestion(list));
    print(333333);
    DBProvider.updateItem(data.questionID, data.answerResult.toString());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        if (type == 1) {
          questionIndex = questionIndex - 1;
        } else {
          questionIndex = questionIndex + 1;
        }
      });
    });
  }

  void clickSidebar(index) {
    setState(() {
      questionIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    context.read<QuestionBloc>().add(GetQuestion());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionBloc, QuestionState>(builder: (context, state) {
      if (state.ListQuestion.isNotEmpty) {
        totalItem = state.ListQuestion.length - 1;
        void onChangeAnswerQuiz(answer, questionID) {
          var indexQ = state.ListQuestion.indexWhere((person) => person.questionID == questionID);
          state.ListQuestion[indexQ].answerResult = answer;
          print(jsonEncode(state.ListQuestion[indexQ]));
        }

        return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: totalItem == questionIndex
                    ? Text(
                        'Hoàn thành',
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        'Dừng lại',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ],
            title: Text("Tên khảo sát"),
            centerTitle: true,
          ),
          body: Quiz(
            questions: state.ListQuestion,
            fnChangeAnswerQuiz: onChangeAnswerQuiz,
            questionIndex: questionIndex,
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                questionIndex != 0
                    ? Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                fnQuestionsIndex(
                                    1, state.ListQuestion[questionIndex], state.ListQuestion);
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Icon(Icons.arrow_left), Text('Trở lại')]),
                            )))
                    : SizedBox(),
                questionIndex < totalItem
                    ? Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                fnQuestionsIndex(
                                    2, state.ListQuestion[questionIndex], state.ListQuestion);
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('Tiếp theo'), Icon(Icons.arrow_right)]),
                            )))
                    : SizedBox(),
              ],
            ),
          ),
          drawer: Drawer(
              child: Scaffold(
            appBar: AppBar(title: Text('Thông tin')),
            body: ListView.separated(
                itemCount: state.ListQuestion.where((e) => e.questionParent == null).length,
                separatorBuilder: (_, __) => Container(height: 1.5, color: Colors.grey[300]),
                itemBuilder: (BuildContext context, int index) =>
                    EntryItem(test(state.ListQuestion)[index], clickSidebar, state.ListQuestion)),
          )),
        );
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}

List<Entry> test(List<JsonQuestionModel> list) {
  List<Entry> dataD = list
      .where((e) => e.questionParent == null)
      .map((item) => Entry(
          item.questionName, item.questionID, _buildChildren(list, item.questionID.toString())))
      .toList();
  return dataD;
}

List<Entry> _buildChildren(List<JsonQuestionModel> list, String parentId) {
  List<Entry> children = [];
  for (JsonQuestionModel item in list) {
    if (item.questionParent == parentId) {
      children.add(Entry(
          item.questionName, item.questionID, _buildChildren(list, item.questionID.toString())));
    }
  }
  return children;
}

class Entry {
  final String? title;
  final String? questionID;
  final List<Entry>
      children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, this.questionID, [this.children = const <Entry>[]]);
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.clickTitlt, this.list);
  final Entry entry;
  final Function clickTitlt;
  final List<JsonQuestionModel> list;
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      var indexQ = list.indexWhere((person) => person.questionID == root.questionID);
      return ListTile(
        title: GestureDetector(
          onTap: () => clickTitlt(indexQ),
          child: ListTile(
            title: Text(root.title.toString()),
            shape: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
          ),
        ),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title.toString()),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
