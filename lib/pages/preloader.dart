import 'dart:convert';

import 'package:Face_recognition/pages/profile.dart';
import 'package:Face_recognition/pages/welcome.dart';
import 'package:Face_recognition/utils/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preloader extends StatefulWidget {
  @override
  _PreloaderState createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  SharedPref sharedPref = SharedPref();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    //localStorage.remove('user');
    var user = localStorage.getString('user');
    try {
      if (user != null) {
        print(user);
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => Profile(data: jsonDecode(user))),
        );
      } else {
        //List users = await sharedPref.readAll('users');
        //print(user);
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => Welcome()),
        );
      }
    } catch (e) {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => Welcome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
