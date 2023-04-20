import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListSurvey extends StatefulWidget {
  final int index;
  const ListSurvey(this.index, {Key? key}) : super(key: key);
  @override
  _ListSurveyState createState() => _ListSurveyState();
}

class _ListSurveyState extends State<ListSurvey> {
  TextEditingController controller = TextEditingController();
  final String url = 'https://jsonplaceholder.typicode.com/users';
  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(UserDetails.fromJson(user));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print(widget.index);
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Danh sách khảo sát"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: TextField(
                      controller: controller,
                      decoration: InputDecoration(hintText: 'Search', border: InputBorder.none),
                      onChanged: onSearchTextChanged,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        controller.clear();
                        onSearchTextChanged('');
                      },
                    ),
                  ),
                ),
              )),
          Expanded(
            child: _searchResult.isNotEmpty || controller.text.isNotEmpty
                ? ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Card(
                        elevation: 8,
                        shadowColor: const Color(0xff2da9ef),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          leading: Container(
                            width: 2,
                            color: const Color(0xff2da9ef),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "1111111",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "13333",
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontSize: 16,
                            ),
                          ),
                          trailing: Text(
                            "12mvvn",
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ));
                    },
                  )
                : ListView.builder(
                    itemCount: _userDetails.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Card(
                        elevation: 8,
                        shadowColor: const Color(0xff2da9ef),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          leading: Container(
                            width: 2,
                            color: const Color(0xff2da9ef),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "1111111",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "13333",
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontSize: 16,
                            ),
                          ),
                          trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.chevron_right_outlined)]),
                        ),
                      ));
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.firstName.contains(text) || userDetail.lastName.contains(text)) {
        _searchResult.add(userDetail);
      }
    });

    setState(() {});
  }
}

List<UserDetails> _searchResult = [];

List<UserDetails> _userDetails = [];

class UserDetails {
  final int id;
  final String firstName, lastName, profileUrl;

  UserDetails(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.profileUrl =
          'https://i.amz.mshcdn.com/3NbrfEiECotKyhcUhgPJHbrL7zM=/950x534/filters:quality(90)/2014%2F06%2F02%2Fc0%2Fzuckheadsho.a33d0.jpg'});

  factory UserDetails.fromJson(Map<dynamic, dynamic> json) {
    return UserDetails(
      id: json['id'],
      firstName: json['name'],
      lastName: json['username'],
    );
  }
}
