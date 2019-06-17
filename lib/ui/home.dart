import 'package:flutter/material.dart';
import 'package:codelab/model/productsRepository.dart';
import 'package:codelab/model/product.dart';

import 'detail.dart';

class HomePage extends StatelessWidget {

  final List<Product> products = ProductsRepository.loadProducts(Category.all);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shrine'),
      ),
      body: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) => _gridItem(context, index)
      ),
    );
  }

  Widget _gridItem(context, index) {

    Product product = products[index];

    return GestureDetector(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 3 / 2,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Text('${product.price} \$')
          ],
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(product: product))
      ),
    );
  }

}
