import 'package:flutter/material.dart';

import 'package:ecommerce/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        title: Text('My Cart'),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
          ),
        ],

      ),
      body: Cartproducts(),




      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total:"),
                subtitle: Text("₹999"),
              ),
            ),
            Expanded(
              child: MaterialButton(
                color: Colors.red,
                onPressed: (){},
                child: Text("Check out",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
            )


          ],


        ),


      ),


    );
  }
}
