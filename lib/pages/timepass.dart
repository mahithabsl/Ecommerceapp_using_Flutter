import 'package:ecommerce/pages/signup.dart';
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

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
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
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
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/back.jpg!d',
            fit:BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
//          Container(
//            alignment:  Alignment.topCenter,
//            child: Image.asset("assets/logo.png"),
//            width: 150,
//            height: 150,
//          ),
            Container(
              color: Colors.black.withOpacity(0.4),
              width: double.infinity,
              height: double.infinity,

            ),
            Padding(
              padding: const EdgeInsets.only(top:280.0),
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child: Form(
                    key: _formKey,
                    child:Column(
                      children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(14,8,14,8),
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white.withOpacity(0.8),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: TextFormField(
                                  controller: _emailTextController,

                                  decoration: InputDecoration(

                                    isDense: true,
                                    hintText: "Email",
                                    icon: Icon(Icons.email),
                                      border: InputBorder.none

//                                  border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Please make sure your email address is valid';
                                      else
                                        return null;
                                    }
                                  },

                                ),
                              ),
                            ),
                          ),

//
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14,8,14,8),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextFormField(
                                controller: _passwordTextController,

                                decoration: InputDecoration(

                                  isDense: true,
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none

//                                  border: OutlineInputBorder(),
                                ),
//                              keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'The password cannot be empty';
                                  }
                                  else if (value.length<6)
                                    return 'The password has to be atleast 6 letters long';
                                  else
                                    return null;
                                },

                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 8,14, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.red,
                            elevation: 0.0,
                            child:  MaterialButton(
                              onPressed: (){},
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text("login",textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Forgot password?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16
                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) =>new Signup()));
                            },
                            child: Text("Sign up !",style: TextStyle(
                                color: Colors.red,
                                fontSize: 16
                            )),
                          ),
                        ),






                        Expanded(child: Container(),),
                        Divider(color: Colors.white,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.red,
                            elevation: 0.0,
                            child:  MaterialButton(
                              onPressed: (){
                                handleSignIn();
                              },
                              minWidth: MediaQuery.of(context).size.width,

                              child: Text("Sign in with google",textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                ),
                              ),
                            ),
                          ),
                        ),




                      ],
                     )),
                    ),
              ),
            ),


        ],
      ),


    );
  }

}

