import 'package:Face_recognition/pages/login.dart';
import 'package:Face_recognition/pages/register_face.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Expanded(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 45, left: 10, right: 10),
                    child: Text(
                      'Create a profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Full name"),
                    //keyboardType: TextInputType.multiline,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Email Address"),
                    //keyboardType: TextInputType.multiline,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: phone,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Phone Number"),
                    //keyboardType: TextInputType.multiline,
                  ),
                ),
              ],
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.blue,
                onPressed: () {
                  if (name.text.length > 0 && email.text.length > 0) {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => RegisterFace(data: {
                                'name': name.text,
                                'email': email.text,
                                'phone': phone.text,
                                'photo': '',
                              })),
                    );
                  } else {
                    _scaffoldKey.currentState.showSnackBar(new SnackBar(
                        content: new Text('All fields are required')));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Register Face",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
