import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:test_task/models/productData.dart';
import 'package:test_task/widgets/productsViewWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Product>> LoadDataFromJSONFile() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('src/products.json');
    print(jsondata);
    final products = json.decode(jsondata) as List<dynamic>;
    return products.map((e) => Product.fromJSON(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FutureBuilder(
        future: LoadDataFromJSONFile(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text('${data.error}'),
            );
          } else if (data.hasData) {
            var products = data.data as List<Product>;
            return ProductsView(
              products: products,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}
