import 'package:flutter/material.dart';
import 'package:grocery_app/view/home/components/popular_product/popular_product_loading_card.dart';

class PopularProductLoading extends StatelessWidget {
  const PopularProductLoading({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: 4,

          itemBuilder: (context, index)=>PopularProductLoadingCard()),
    );;
  }
}
