//import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'home.dart';
//
//class Login extends StatefulWidget {
//  @override
//  _LoginState createState() => _LoginState();
//}
//
//class _LoginState extends State<Login> {
//
//  final FirebaseAuth _auth  = FirebaseAuth.instance;
//  final GoogleSignIn _googlSignIn = new GoogleSignIn();
//
//  Future<FirebaseUser> _handleSignIn(BuildContext context) async {
//
//    GoogleSignInAccount googleUser = await _googlSignIn.signIn();
//    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//      accessToken: googleAuth.accessToken,
//      idToken: googleAuth.idToken,
//    );
//    final FirebaseUser userDetails = (await _auth.signInWithCredential(credential)).user;
//    print("signed in " + userDetails.displayName);
//
//    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);
//
//    List<ProviderDetails> providerData = new List<ProviderDetails>();
//    providerData.add(providerInfo);
//
//    UserDetails details = new UserDetails(
//      userDetails.providerId,
//      userDetails.displayName,
//      userDetails.photoUrl,
//      userDetails.email,
//      providerData,
//    );
//
//    Navigator.push(
//      context,
//      new MaterialPageRoute(
//        builder: (context) => new Home(),
//      ),
//    );
//    return userDetails;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Builder(
//        builder: (context) => Stack(
//          fit: StackFit.expand,
//          children: <Widget>[
//            Container(
//              width: MediaQuery.of(context).size.width,
//              height:  MediaQuery.of(context).size.height,
//            ),
//            Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                SizedBox(height:10.0),
//                Container(
//                    width: 250.0,
//                    child: Align(
//                      alignment: Alignment.center,
//                      child: RaisedButton(
//                        shape: RoundedRectangleBorder(
//                            borderRadius: new BorderRadius.circular(30.0)),
//                        color: Color(0xffffffff),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.start,
//                          children: <Widget>[
//
//                            SizedBox(width:10.0),
//                            Text(
//                              'Sign in with Google',
//                              style: TextStyle(color: Colors.black,fontSize: 18.0),
//                            ),
//                          ],),
//                        onPressed: () => _handleSignIn(context)
//                            .then((FirebaseUser user) => print(user))
//                            .catchError((e) => print(e)),
//                      ),
//                    )
//                ),
//              ],
//            ),
//          ],
//        ),),
//    );
//  }
//
//
//}
//
//
//class UserDetails {
//  final String providerDetails;
//  final String userName;
//  final String photoUrl;
//  final String userEmail;
//  final List<ProviderDetails> providerData;
//
//  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
//}
//
//
//class ProviderDetails {
//  ProviderDetails(this.providerDetails);
//  final String providerDetails;
//}
//
//
