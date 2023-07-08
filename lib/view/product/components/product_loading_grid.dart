import 'package:flutter/material.dart';
import 'package:grocery_app/view/product/components/product_loading_card.dart';


class ProductLoadingGrid extends StatelessWidget {
  const ProductLoadingGrid({super.key});

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
      itemCount: 6,
      itemBuilder: (context, index) => const ProductLoading(),
    );
  }
}
