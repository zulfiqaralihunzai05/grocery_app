import 'package:flutter/material.dart';
import 'package:grocery_app/view/product/components/prooduct_card.dart';
import '../../../model/product.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({Key? key, required this.products}):super(key: key);


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 10,
        childAspectRatio: 2/3,
        mainAxisSpacing: 10,
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(product: products[index]),
    );
  }
}
