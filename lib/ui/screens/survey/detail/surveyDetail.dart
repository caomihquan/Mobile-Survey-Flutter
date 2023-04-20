import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/survey/detail/quiz.dart';
import 'package:pokedex/ui/screens/survey/model/modelAnswer.dart';
import 'package:pokedex/ui/screens/survey/model/modelQuestion.dart';

class SurveyDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SurveyDetailScreenState();
}

class _SurveyDetailScreenState extends State<SurveyDetail> {
  final List<Entry> data = <Entry>[
    Entry(
      'Chapter A',
      <Entry>[
        Entry(
          'Section A0',
          <Entry>[
            Entry('Item A0.1'),
            Entry('Item A0.2'),
            Entry('Item A0.3'),
          ],
        ),
        Entry('Section A1'),
        Entry('Section A2'),
      ],
    ),
    // Second Row
    Entry('Chapter B', <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ]),
    Entry(
      'Chapter C',
      <Entry>[
        Entry('Section C0'),
        Entry('Section C1'),
        Entry(
          'Section C2',
          <Entry>[
            Entry('Item C2.0'),
            Entry('Item C2.1'),
            Entry('Item C2.2'),
            Entry('Item C2.3'),
          ],
        )
      ],
    ),
  ];

  final List<ModelQuestion> _questions = [
    ModelQuestion(
        QuestionID: 1,
        QuestionName: 'Process of inserting an element in stack is called?',
        QuestionType: 1,
        AnswerResult: "",
        Answers: [
          ModelAnswer(AnswerID: 1, AnswerName: 'ok'),
          ModelAnswer(AnswerID: 2, AnswerName: 'ko'),
        ]),
    ModelQuestion(
        QuestionID: 2,
        QuestionName: 'How Are You?',
        QuestionType: 2,
        AnswerResult: "",
        Answers: [
          ModelAnswer(AnswerID: 3, AnswerName: 'fine'),
          ModelAnswer(AnswerID: 4, AnswerName: 'not okay'),
        ]),
    ModelQuestion(
        QuestionID: 3,
        QuestionName: 'How Are You?',
        QuestionType: 3,
        AnswerResult: "",
        Answers: [
          // ModelAnswer(AnswerID: 3, AnswerName: 'fine'),
          // ModelAnswer(AnswerID: 4, AnswerName: 'not okay'),
        ]),
    ModelQuestion(
        QuestionID: 4,
        QuestionName: 'How Are You?',
        QuestionType: 4,
        AnswerResult: "",
        Answers: [
          ModelAnswer(AnswerID: 3, AnswerName: 'fine'),
          ModelAnswer(AnswerID: 4, AnswerName: 'not okay'),
        ])
  ];

  var _questionIndex = 0;

  void _fnQuestionsIndex(type) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        if (type == 1) {
          _questionIndex = _questionIndex - 1;
        } else {
          _questionIndex = _questionIndex + 1;
        }
      });
    });
  }

  var answerID = 0;
  void onChangeAnswerQuiz(answer, questionID) {
    var indexQ = _questions.indexWhere((person) => person.QuestionID == questionID);
    setState(() {
      if (_questions[indexQ].QuestionType == 2) {
        if (_questions[indexQ].AnswerResult.toString().contains(answer.toString())) {
          _questions[indexQ].AnswerResult = _questions[indexQ]
              .AnswerResult
              .toString()
              .replaceAll(answer.toString(), "")
              .split(";")
              .where((element) => element != '')
              .join(";");
        } else {
          _questions[indexQ].AnswerResult =
              _questions[indexQ].AnswerResult + ";" + answer.toString();
        }
      } else {
        _questions[indexQ].AnswerResult = answer.toString();
      }

      print(_questions[indexQ].AnswerResult);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Dừng lại',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        title: Text("Tên khảo sát"),
        centerTitle: true,
      ),
      body: Quiz(
        questions: _questions,
        fnQuestionIndex: _fnQuestionsIndex,
        fnChangeAnswerQuiz: onChangeAnswerQuiz,
        questionIndex: _questionIndex,
      ), //
      drawer: Drawer(
          child: Scaffold(
        appBar: AppBar(title: Text('Thông tin')),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) => EntryItem(
            data[index],
          ),
        ),
      )),
    );
  }
}

class Entry {
  final String title;
  final List<Entry>
      children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, [this.children = const <Entry>[]]);
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
