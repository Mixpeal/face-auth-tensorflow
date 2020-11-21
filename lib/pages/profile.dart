import 'dart:io';

import 'package:Face_recognition/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final Map data;
  final String message;
  const Profile({Key key, this.data, this.message}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File jsonFile;
  Directory tempDir;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            widget.message != null
                ? Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 50),
                      decoration: BoxDecoration(color: Colors.green),
                      child: Text(
                        "${widget.message}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : SizedBox(),
            Expanded(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                      child: Text(
                        'Hello, ${widget.data['name']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom: 50, left: 10, right: 10),
                      child: Text(
                        '${widget.data['email']}/${widget.data['phone']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontStyle: FontStyle.italic),
                      )),
                ],
              )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: Colors.brown,
                      onPressed: () async {
                        SharedPreferences localStorage =
                            await SharedPreferences.getInstance();
                        localStorage.remove('user');
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => Welcome()),
                        );
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: Colors.blue,
                      onPressed: () async {
                        tempDir = await getApplicationDocumentsDirectory();
                        String _embPath = tempDir.path + '/emb.json';
                        jsonFile = new File(_embPath);
                        if (jsonFile.existsSync()) jsonFile.deleteSync();
                        SharedPreferences localStorage =
                            await SharedPreferences.getInstance();
                        localStorage.remove('user');
                        localStorage.remove('users');
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => Welcome()),
                        );
                      },
                      child: Text(
                        "Delete Users",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
