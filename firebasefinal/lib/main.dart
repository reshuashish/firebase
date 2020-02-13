import 'package:flutter/material.dart';
import 'firebase.dart';

String Email = '';
String Pass = '';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Auth());
  }
}

class Auth extends StatefulWidget {
  Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final email = TextEditingController();

  final password = TextEditingController();
  firebaseAuth realauth = firebaseAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: "email",
              ),
              onEditingComplete: () {
                Email = email.text;
                print(email.text);
              },
            ),
            TextFormField(
                controller: password,
                decoration: InputDecoration(
                  hintText: "password",
                ),
                onEditingComplete: () {
                  Pass = password.text;
                  print(password.text);
                }),
            FlatButton(
              child: Text('googlelogin'),
              onPressed: () async {
                dynamic singedin = await realauth.googlelogin();
                if (singedin == null) {
                  print('error');
                } else {
                  print(singedin);

                  print('hii');
                }
              },
            ),
            FlatButton(
                child: Text('googlelogout'),
                onPressed: () async {
                  dynamic singedin = await realauth.googlelogout();
                  if (singedin == null) {
                    print('error');
                  } else {
                    print(singedin);
                    print(singedin.currentuser);
                    print('hii');
                  }
                }),
            FlatButton(
              child: Text('login'),
              onPressed: () async {
                dynamic singedin = await realauth.emaillogin();
                if (singedin == null) {
                  print('error');
                } else {
                  print(singedin);
                  print(singedin.email);
                  print('hii');
                }
              },
            ),
            FlatButton(
              child: Text('signup'),
              onPressed: () async {
                dynamic singedin = await realauth.emailsignup();
                if (singedin == null) {
                  print('error');
                } else {
                  print(singedin);
                  print(singedin.email);
                  print('hii');
                }
              },
            ),
            FlatButton(
              child: Text('anonymous'),
              onPressed: () async {
                dynamic singedin = await realauth.singin();
                if (singedin == null) {
                  print('error');
                } else {
                  print(singedin);
                  print(singedin.uid);
                  print('hii');
                }
              },
            ),
            FlatButton(
              child: Text('logout'),
              onPressed: () async {
                await realauth.logout();
                print('logout');
              },
            ),
          ],
        ),
      ),
    );
  }
}
