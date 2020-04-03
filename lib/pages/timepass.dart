import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth _auth= FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedin = false;


  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async{

    preferences = await SharedPreferences.getInstance();
    isLoggedin=await googleSignIn.isSignedIn();


  }
  Future<FirebaseUser> handleSignIn() async{
    preferences = await SharedPreferences.getInstance();


    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser  user= (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    if(user!=null){
      final QuerySnapshot result = await Firestore.instance.collection("users").where("id",isEqualTo: user.uid).getDocuments();
      final List<DocumentSnapshot>  documents = result.documents;
      if(documents.length==0)
        //insert the user to our collection
          {
        Firestore.instance.collection("users").document(user.uid).setData({
          "id" :user.uid,
          "username":user.displayName,
          "profilepicture": user.photoUrl,
        });
        await preferences.setString("id", user.uid);
        await preferences.setString("username", user.displayName);
        await preferences.setString("photourl",user.photoUrl);
      }
      else{
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photourl",documents[0]['photourl']);

      }
      Fluttertoast.showToast(msg: "Login was successful");

    }
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new Home(),
      ),
    );

    return user;


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Login",
          style: TextStyle(
              color: Colors.red
          ),
        ),
        elevation: 0.1,
      ),
      body: Stack(
        children: <Widget>[
          Center(

            child: FlatButton(
              color: Colors.red,
              onPressed: (){
                handleSignIn();
              },
              child: Text("Sign in/Sign up with google",
                style: TextStyle(
                    color: Colors.white
                ),),
            ),
          ),
          Visibility(
            visible: loading?? true,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
          )


        ],
      ),

    );
  }

}
