import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/percent_indicator.dart';
import '../../../routes.dart';

class Progress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<Progress> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  void getData() async {
    try {
      var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      print(1);
      print(res.body.toString());
    } catch (err) {
      print(err);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Tiến độ"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Center(
                  child: CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 12.0,
                animation: true,
                percent: 0.7,
                center: Text(
                  "70.0%",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: Text(
                  "Tiến độ khảo sát",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.green,
              )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Tiến độ: DT199000',
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: (Colors.grey),
                        width: 0.5,
                      ),
                    )),
                    child: Row(
                      children: [
                        Text('ádfasfsdafsaf'),
                        Spacer(),
                        Text('10'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Text('ádfasfsdafsaf'),
                        Spacer(),
                        Text('10'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Text('ádfasfsdafsaf'),
                        Spacer(),
                        Text('10'),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
