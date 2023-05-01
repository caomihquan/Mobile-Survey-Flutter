import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/ui/screens/survey/listSurvey/listSurvey.dart';
import '../../../../routes.dart';

class SurveyProgress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SurveyProgressScreenState();
}

class _SurveyProgressScreenState extends State<SurveyProgress> {
  @override
  void initState() {
    super.initState();
  }

  void onSelectd(index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListSurvey(index),
        settings: RouteSettings(
          arguments: index,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<String> entries = <String>['Đang phỏng vấn', 'Chưa phỏng vấn', 'Đã phỏng vấn'];
  final List<int> entriesSub = <int>[10, 5, 7];
  final List<Color> colorCodes = [
    Color.fromARGB(207, 56, 155, 255),
    Color.fromARGB(206, 255, 90, 79),
    Color.fromARGB(208, 92, 227, 92)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Tiến độ khảo sát"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  onSelectd(index);
                },
                child: Container(
                    height: 100,
                    padding: const EdgeInsets.all(8),
                    color: colorCodes[index],
                    child: Row(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${entries[index]}',
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            SizedBox(height: 6),
                            Text('Số bài: ${entriesSub[index]}')
                          ]),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: Colors.white,
                      ),
                    ])),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        ));
  }
}
