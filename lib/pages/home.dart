import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/pages/cart.dart';
import 'package:ecommerce/components/drawer.dart';
import 'package:ecommerce/components/hor_listview';
import 'package:ecommerce/components/products.dart';
import 'package:ecommerce/pages/product_details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    Widget imageCarousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/w3.jpeg'),
          AssetImage('assets/w4.jpeg'),
          AssetImage('assets/w1.jpeg'),
          AssetImage('assets/m1.jpeg'),
          AssetImage('assets/m2.jpg'),
          AssetImage('assets/c1.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        dotSize: 5.0,
        dotBgColor: Colors.transparent,
        //showIndicator: false,
        indicatorBgPadding: 6.0,
      ),

    );

    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        title: Text('FlipMart'),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>new Cart()
                ),
              );
            },
          )
        ],

      ),
      drawer: AppDrawer(),
      body: Column(
//      scrollDirection: Axis.vertical,

        children: <Widget>[

          imageCarousel,

          SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  "Categories",
                  textAlign: TextAlign.left,

              ),
            ),
          ),
          HorizontalView(),

          SizedBox(
            height: 5.0,
          ),

          SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Recent trends",
                textAlign: TextAlign.left,


              ),
            ),
          ),
          //grid view starts
          Flexible(
            child: Products(),
          )
        ],
      ),

    );
  }
}



