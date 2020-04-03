import 'package:flutter/material.dart';

class Cartproducts extends StatefulWidget {
  @override
  _CartproductsState createState() => _CartproductsState();
}

class _CartproductsState extends State<Cartproducts> {
  @override

  var Products_in_cart=[
    {
      'name':'Blazer',
      'picture':'assets/products/blazer1.jpeg',
      'price': 899,
      'size': "M",
      'color':"Black",
      'quantity':1
    },
    {
      'name':'Brown heels',
      'picture':'assets/products/hills1.jpeg',
      'price': 799,
      'size': "7",
      'color':"Brown",
      'quantity':1
    },
  ];


  Widget build(BuildContext context) {

    return ListView.builder(

        itemCount: Products_in_cart.length,
          itemBuilder: (context,index){
            return Single_Cart_Product(
              cart_prod_name: Products_in_cart[index]['name'],
              cart_prod_picture: Products_in_cart[index]['picture'],
              cart_prod_price: Products_in_cart[index]['price'],
              cart_prod_size: Products_in_cart[index]['size'],
              cart_prod_color: Products_in_cart[index]['color'],
              cart_prod_quantity: Products_in_cart[index]['quantity'],

            );
          }
    );
  }
}

class  Single_Cart_Product extends StatelessWidget {

  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_quantity;

  Single_Cart_Product
      ({this.cart_prod_name,
        this.cart_prod_picture,
        this.cart_prod_price,
        this.cart_prod_size,
        this.cart_prod_color,
        this.cart_prod_quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          isThreeLine: true,
          trailing:
          FittedBox(
            fit: BoxFit.fill,
            child:
            Column(
              children: <Widget>[
                IconButton(icon: Icon(Icons.arrow_drop_up,color: Colors.red),iconSize: 400, onPressed: () {}),
                Text('$cart_prod_quantity',style: TextStyle(fontSize: 300,fontWeight: FontWeight.bold),),
                IconButton(icon: Icon(Icons.arrow_drop_down,color: Colors.red,),iconSize: 400, onPressed: () {}),

              ],
            ),
          ),

          leading: Image.asset(cart_prod_picture,
            height:80,
            width:80,
          ),
          title: Text(cart_prod_name),
          subtitle: Column(
            children: <Widget>[
              Row(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text("Size:"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(cart_prod_size,
                      style: TextStyle(
                          color: Colors.red
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,8,8,8),
                    child: Text("Color:",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(cart_prod_color,
                      style: TextStyle(
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                alignment: Alignment.topLeft,
                child: Text("\₹$cart_prod_price",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

