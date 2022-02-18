import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/productData.dart';

class ProductsView extends StatelessWidget {
  ProductsView({Key? key, required this.products}) : super(key: key);
  late List<Product> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: products.length,
      itemBuilder: (context, index) => Card(
          child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Image.network(products[index].image),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        products[index].price.toString() + '₽',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(213, 173, 194, 124)),
                      ),
                      Text(
                        products[index].category ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                      Text(
                        products[index].name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
