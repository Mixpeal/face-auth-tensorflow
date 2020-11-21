import 'package:Face_recognition/pages/create.dart';
import 'package:Face_recognition/pages/login.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.contain,
                      height: 50,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 50, left: 10, right: 10),
                      child: Text(
                        'Face Authentication using Tensorflow & Flutter',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 28),
                      )),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => Create()),
                      );
                    },
                    child: Text(
                      "Create a Profile",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text('Developed by VIDA ESHUN')),
            )
          ],
        ),
      ),
    );
  }
}
