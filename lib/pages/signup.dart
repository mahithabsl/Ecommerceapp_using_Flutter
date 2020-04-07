import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController = TextEditingController();
  String gender;
  String groupValue='male';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/back.jpg!d',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,

          ),
          Padding(
            padding: const EdgeInsets.only(top: 280.0),
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextFormField(
                                controller: _nameTextController,

                                decoration: InputDecoration(

                                  isDense: true,
                                  hintText: "Full name",
                                  icon: Icon(Icons.person_outline),

//                                  border: OutlineInputBorder(),
                                ),
//                              keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'The name field cannot be empty';
                                  }

                                  return null;
                                },

                              ),
                            ),
                          ),
                        ),

                        Row(
                          children: <Widget>[
                            Expanded(
                                child:
                                  ListTile(
                                      title:Text("male",style: TextStyle(color: Colors.white),textAlign: TextAlign.end,),
                                      trailing: Radio(value: "male", groupValue: groupValue, onChanged:(e) => valueChanged(e)),

                                  )
                            ),
                            Expanded(
                                child:
                                ListTile(
                                    title:Text("female",style: TextStyle(color: Colors.white),textAlign: TextAlign.end),
                                    trailing: Radio(value: "female", groupValue: groupValue, onChanged:(e) => valueChanged(e)),

                                )
                            ),

                          ],
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
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
                          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
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

//                                  border: OutlineInputBorder(),
                                ),
//                              keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'The password cannot be empty';
                                  }
                                  else if (value.length < 6)
                                    return 'The password has to be atleast 6 letters long';
                                  else
                                    return null;
                                },

                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextFormField(
                                controller: _confirmPasswordTextController,

                                decoration: InputDecoration(

                                  isDense: true,
                                  hintText: "Confirm Password",
                                  icon: Icon(Icons.lock_outline),

//                                  border: OutlineInputBorder(),
                                ),
//                              keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'The password cannot be empty';
                                  }
                                  else if (value.length < 6)
                                    return 'The password has to be atleast 6 letters long';
                                  else
                                    return null;
                                },

                              ),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Text("Sign up", textAlign: TextAlign.center,
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
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text("Login ?", style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16
                            )),
                          ),
                        ),


                        Expanded(child: Container(),),
                        Divider(color: Colors.white,),


                      ],
                    )),
              ),
            ),
          ),



        ],
      ),


    );
  }

  valueChanged(e) {
    setState(() {

      if(e=="male") {
        groupValue = e;
        gender=e;
      }
      else if(e=="female") {
        groupValue = e;
        gender=e;
      }

    });

  }
  }
