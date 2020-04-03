import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/main.dart';
import 'home.dart';
class ProductDetails extends StatefulWidget {

  final prod_detail_name;
  final prod_detail_picture;
  final prod_detail_old_price;
  final prod_detail_price;

  ProductDetails({
    this.prod_detail_name,
    this.prod_detail_picture,
    this.prod_detail_old_price,
    this.prod_detail_price,
  });


  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        title: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>new Home()));
            },
            child: Text('FlipMart')
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
          ),
        ],

      ),
      body:ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.prod_detail_picture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.prod_detail_name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("\₹${widget.prod_detail_old_price}",
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough
                        ),
                        ),
                      ),
                      Expanded(
                        child: Text("\₹${widget.prod_detail_price}",
                        style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                      showDialog(context: context,
                      builder: (context){
                      return new AlertDialog(
                      title: Text("Size"),
                      content: Text("Choose the size"),
                      actions: <Widget>[
                      new MaterialButton(onPressed: (){
                      Navigator.of(context).pop(context);
                      },
                      child: Text("close"),)
                      ],
                      );
                      });
                      },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Size"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: Text("Colors"),
                            content: Text("Choose a color"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: Text("close"),)
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Color"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: Text("Quantity"),
                            content: Text("Choose the Quantity"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: Text("close"),)
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Qty"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

          //buy

          Row(

            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  height:50,
                  onPressed: (){},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Buy now"),
                ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){},color: Colors.red,),

              new IconButton(icon: Icon(Icons.favorite_border), onPressed: (){},color: Colors.red),



            ],
          ),

          Divider(),
          new ListTile(
            title: Text("Product Details"),
            subtitle:Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            ),


          ),
          Divider(),
          Row(
            children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15,5,5,5),
              child: Text("Product Name",style: TextStyle(
                color: Colors.grey
              ),),
            ),
             Padding(padding: EdgeInsets.all(5),
             child: Text(widget.prod_detail_name),)
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15,5,5,5),
                child: Text("Product Brand",style: TextStyle(
                    color: Colors.grey
                ),),
              ),
              Padding(padding: EdgeInsets.all(5),
                child: Text("Brand X"),)
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15,5,5,5),
                child: Text("Product Condition",style: TextStyle(
                    color: Colors.grey
                ),),
              ),
              Padding(padding: EdgeInsets.all(5),
                child: Text("New"),)
            ],
          ),

          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,5,5,5),
            child: Text("Similar products"),
          ),
          //similar products section
          Container(
            height: 350,
            child: SimilarProducts(),
          )



        ],

      ),


    );
  }
}


class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var product_list=[
    {
      'name':'Black dress',
      'picture':'assets/products/dress2.jpeg',
      'old_price': 899,
      'price': 599,
    },
    {
      'name':'Red heels',
      'picture':'assets/products/hills2.jpeg',
      'old_price': 999,
      'price': 799,
    },
    {
      'name':'Grey pants',
      'picture':'assets/products/pants2.jpeg',
      'old_price': 599,
      'price': 399,
    },
    {
      'name':'Mini Skirt',
      'picture':'assets/products/skt2.jpeg',
      'old_price': 499,
      'price': 299,
    },

  ];

  @override
  Widget build(BuildContext context) {

    return GridView.builder(

        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {

          return SimilarProduct (
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });


  }
}


class SimilarProduct extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  SimilarProduct({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>new ProductDetails(

                      prod_detail_name: prod_name,
                      prod_detail_picture: prod_picture,
                      prod_detail_old_price: prod_old_price,
                      prod_detail_price: prod_price,


                    ))
                );

              },
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\₹$prod_price",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\₹$prod_old_price",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration
                                :TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}


