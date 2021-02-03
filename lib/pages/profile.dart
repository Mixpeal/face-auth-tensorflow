import 'dart:io';

import 'package:Face_recognition/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

class Profile extends StatefulWidget {
  final Map data;
  final String message;
  const Profile({Key key, this.data, this.message}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String photo;
  File jsonFile;
  Directory tempDir;

  @override
  void initState() {
    super.initState();
    //print(widget.data);
  }

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
                  widget.data['photo'] != null &&
                          widget.data['photo'].length > 0
                      ? Transform(
                          transform: Matrix4.rotationY(-2 * math.pi / 2),
                          alignment: Alignment.center,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 5,
                                      color: Colors.black.withOpacity(0.05))),
                              child: Image.file(
                                File(widget.data['photo']),
                                height: 150,
                              )),
                        )
                      : SizedBox(),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.1, color: Colors.black)),
                      child: Column(
                        children: [
                          EachList(
                              title: "Name", value: "${widget.data['name']}"),
                          EachList(
                              title: "Email", value: "${widget.data['email']}"),
                          EachList(
                              title: "Phone Number",
                              value: "${widget.data['phone']}"),
                        ],
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

class EachList extends StatelessWidget {
  final String title, value;

  const EachList({Key key, this.title, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        // decoration: BoxDecoration(
        //     border:
        //         Border(bottom: BorderSide(width: 0.1, color: Colors.black))),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '$title: ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Text(
              '$value',
              style: TextStyle(fontSize: 15),
            )
          ],
        ));
  }
}
