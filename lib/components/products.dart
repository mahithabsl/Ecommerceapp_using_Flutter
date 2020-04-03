import 'package:ecommerce/pages/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}



class _ProductsState extends State<Products> {

  var product_list=[
    {
      'name':'Blazer',
      'picture':'assets/products/blazer1.jpeg',
      'old_price': 1299,
      'price': 899,
    },
    {
      'name':'Red Gown',
      'picture':'assets/products/dress1.jpeg',
      'old_price': 899,
      'price': 599,
    },
    {
      'name':'Brown heels',
      'picture':'assets/products/hills1.jpeg',
      'old_price': 999,
      'price': 799,
    },
    {
      'name':'Black pants',
      'picture':'assets/products/pants1.jpg',
      'old_price': 599,
      'price': 399,
    },
    {
      'name':'Grey shoe',
      'picture':'assets/products/shoe1.jpg',
      'old_price': 799,
      'price': 599,
    },
    {
      'name':'Mini Skirt',
      'picture':'assets/products/skt1.jpeg',
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

        return Product (
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
    });


  }

}


class Product extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Product({
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
