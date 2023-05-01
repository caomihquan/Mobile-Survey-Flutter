import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/Database.dart';
import 'package:pokedex/core/apiHttpService.dart';
import 'package:pokedex/states/user/bloc/user_bloc.dart';
import 'package:pokedex/states/user/model/UserModel.dart';
import '../../../core/InternetConnection.dart';
import '../../../core/location.dart';
import '../../../routes.dart';
import '../../widgets/alert.dart';
import 'dart:io';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
    getPosition();
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void getPosition() async {
    var location = await Location.determinePosition();

    print(location);
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  void login(username, password) async {
    if (username == null || username == '') {
      return showAlert.show(context, 'error', 'Thông báo', 'Vui lòng nhập tên đăng nhập');
    }
    if (password == null || password == '') {
      return showAlert.show(context, 'error', 'Thông báo', 'Vui lòng nhập mật khẩu');
    }
    if (_source.keys.toList()[0] == ConnectivityResult.none) {
      return showAlert.show(
          context,
          'error',
          'Thông báo',
          'Không có kết nối mạng bạn vẫn muốn sử dụng offline chứ?',
          () => loginOffline(username, password),
          ['Chấp nhận', 'Kiểm tra lại']);
    }
    try {
      var res = await APIHTTP.post(
          "core/authentication/login", {'UserName': username, 'PassWord': password}, null);
      if (res["Error"] == null) {
        var user = UserModel();
        user.EmployeeCode = jsonDecode(res["Data"])["Data"]['EmployeeCode'].toString();
        user.EmployeeName = jsonDecode(res["Data"])["Data"]['EmployeeFullName'].toString();
        context.read<UserBloc>().add(SetUser(user));
        await DBProvider.CreateOfUpadateUser(username, password);
        await AppNavigator.push(Routes.home);
      }
    } catch (err) {
      print(err);
    }
  }

  void loginOffline(UserName, Password) async {
    var dataUser = await DBProvider.getUser(UserName, Password);
    if (dataUser.isNotEmpty) {
      var user = UserModel();
      user.EmployeeCode = dataUser[0].userName.toString();
      user.EmployeeName = dataUser[0].userName.toString();
      context.read<UserBloc>().add(SetUser(user));
      await AppNavigator.push(Routes.home);
    } else {
      return showAlert.show(context, 'error', 'Thông báo', 'Sai tài khoản hoặc mật khẩu');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) => Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/backgroundLogin.png'),
                                  fit: BoxFit.fill)),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Container(
                                    child: Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: Center(
                                    child: Text(
                                      "Đăng nhập",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(color: (Colors.grey[100])!))),
                                      child: TextFormField(
                                        controller: userNameController,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Tên đăng nhập",
                                            hintStyle: TextStyle(color: Colors.grey)),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: passWordController,
                                        obscureText: _obscureText,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Mật khẩu",
                                            hintStyle: TextStyle(color: Colors.grey),
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                              child: GestureDetector(
                                                onTap: _toggle,
                                                child: Icon(
                                                  _obscureText
                                                      ? Icons.visibility_rounded
                                                      : Icons.visibility_off_rounded,
                                                  size: 24,
                                                ),
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                  onTap: () => login(userNameController.text.toString(),
                                      passWordController.text.toString()),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(colors: [
                                          Color.fromRGBO(66, 133, 250, 1),
                                          Color.fromRGBO(97, 150, 230, 0.6),
                                        ])),
                                    child: Center(
                                      child: Text(
                                        "Đăng nhập",
                                        style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 70,
                              ),
                              Container(
                                  child: Text(
                                "v1.0.0",
                                style: TextStyle(color: Color.fromRGBO(66, 133, 250, 1)),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}

class LoginModel {
  String UserName;
  String PassWord;
  LoginModel({
    required this.UserName,
    required this.PassWord,
  });
}
