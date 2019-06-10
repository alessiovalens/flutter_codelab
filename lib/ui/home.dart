import 'package:codelab/model/product.dart';
import 'package:flutter/material.dart';
import '../model/productsRepository.dart';

class HomePage extends StatelessWidget {

  final List<Product> products = ProductsRepository.loadProducts(Category.all);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shrine'),
      ),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }

}
