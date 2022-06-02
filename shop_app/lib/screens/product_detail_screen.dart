import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products_provider.dart';

import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    String productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductsProvider>(context).items.firstWhere(
              (product) => product.id == productId,
            );
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}