import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class firebaseAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future googlelogin() async{

    try{
      GoogleSignInAccount googleuser = await _googleSignIn.signIn();
     return googleuser.email;
    }catch(e){print(e.toString());}

  }
  Future googlelogout() async{

    try{
     GoogleSignInAccount googleuser = await _googleSignIn.signOut();
     return googleuser.email;

    }catch(e){print(e.toString());}

  }

  Future singin() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      print(result.user);
      return user;
    } catch (e) {
      print(e.toString());
      print('error catched');
    }
  }

  Future emailsignup() async {
    try {

      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: Email, password: Pass);
      FirebaseUser user = result.user;
      print(result.user);

      return user;
    } catch (e) {
      print(e.toString());
      print('error catched');
    }
  }

  Future emaillogin() async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: Email, password: Pass);
      FirebaseUser user = result.user;
      print(result.user);
      return user;
    } catch (e) {
      print(e.toString());
      print('error catched');
    }
  }
  Future phonelogin() async{




  }

  Future logout() async {
    return _auth.signOut();
  }
}
