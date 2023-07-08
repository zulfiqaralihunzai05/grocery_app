import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:grocery_app/component/main_header.dart';
import 'package:grocery_app/controller/controllers.dart';
import 'package:grocery_app/view/home/components/popular_category/popular_category.dart';
import 'package:grocery_app/view/home/components/popular_category/popular_category_loading.dart';
import 'package:grocery_app/view/home/components/popular_product/popular_product.dart';
import 'package:grocery_app/view/home/components/popular_product/popular_product_loading.dart';
import 'package:grocery_app/view/home/components/selection_title.dart';

import 'components/carousel_slider/carouse_loading.dart';
import 'components/carousel_slider/carouse_slider_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MainHeader(),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Obx(() {
                  if (homeController.bannereList.isNotEmpty) {
                    return CarouseSliderView(
                        bannerList: homeController.bannereList);
                  } else {
                    return const CarouseLoading();
                  }
                }),
                const SelectionTitle(title: "Popular Category"),
                Obx(() {
                  if (homeController.popularCategoryList.isNotEmpty) {
                    return PopularCategory(
                        categories: homeController.popularCategoryList);
                  } else {
                    return PopularCategoryLoading();
                  }
                }),
                const SelectionTitle(title: "Popular Product"),
                Obx(() {
                  if (homeController.popularProductList.isNotEmpty) {
                    return PopularProduct(
                        popularProducts: homeController.popularProductList);
                  } else {
                    return PopularProductLoading();
                  }
                })
              ],
            ),
          ))
        ],
      ),
    );
  }
}
