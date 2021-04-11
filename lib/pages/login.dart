import 'package:flutter/material.dart';
import 'package:music_app2/pages/home.dart';
import 'package:music_app2/services/track.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final usernameController = TextEditingController();
  final bearerTokenController = TextEditingController();
  Track trackInstance = Track();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold (
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Username'),
              TextField(
                controller: usernameController
              ),
              Text('Bearer Token'),
              TextField(
                controller: bearerTokenController,
              ),
              ElevatedButton(onPressed: () async {
                try {
                  await trackInstance.login(
                      bearerTokenController.text, usernameController.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Home(username: usernameController.text,
                                bearerToken: bearerTokenController.text),
                      ));
                } catch (error) {
                  showAlertDialog(context, "User id or bearer token is incorrect");
                }

              }, child: Text("Load my playlist"))
            ]
          )
        )
      );
    }

  showAlertDialog(BuildContext context, String message) {

    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );


    AlertDialog alert = AlertDialog(
      title: Text("Simple Alert"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}


