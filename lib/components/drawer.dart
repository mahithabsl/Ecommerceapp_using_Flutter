import 'package:flutter/material.dart';

import 'package:ecommerce/pages/cart.dart';
import 'package:ecommerce/main.dart';
import '../pages/home.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

        child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Vijay Devarakonda'),
                accountEmail: Text('vijay.devarakonda@gmail.com'),
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person,color: Colors.white,),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>new Home()
                    ),
                  );
                },
                child: ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home,color: Colors.red),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('My account'),
                  leading: Icon(Icons.person,color: Colors.red),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('My orders'),
                  leading: Icon(Icons.shopping_basket,color: Colors.red),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>new Cart()
                      ),
                  );
                },

                child: ListTile(
                  title: Text('My cart'),
                  leading: Icon(Icons.shopping_cart,color: Colors.red),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Favourites'),
                  leading: Icon(Icons.favorite,color: Colors.red),
                ),
              ),
              Divider(),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings,color: Colors.blue),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('About'),
                  leading: Icon(Icons.help,color: Colors.green),
                ),
              ),

            ]
        ),


    );
  }
}
