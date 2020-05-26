import 'package:flutter/material.dart';
import 'package:hello/models/product.dart';
import 'package:hello/scoped-models/main.dart';
import 'package:hello/widgets/products/product_card.dart';
import 'package:scoped_model/scoped_model.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: (BuildContext context, index) =>
                ProductCard(products[index], index),
            itemCount: products.length)
        : Center(
            child: Text('No products found. Please add some'),
          );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildProductList(model.displayedProducts);
      },
    );
  }
}
