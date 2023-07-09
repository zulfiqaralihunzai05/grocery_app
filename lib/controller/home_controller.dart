import 'package:get/get.dart';
import 'package:grocery_app/model/ad_banner.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/service/local_service/local_category_service.dart';
import 'package:grocery_app/service/local_service/local_product_service.dart';
import 'package:grocery_app/service/remote_service/remote_banner_service.dart';
import 'package:grocery_app/service/remote_service/remote_popular_category_services.dart';
import 'package:grocery_app/service/remote_service/remote_popular_product_service.dart';

import '../model/category.dart';
import '../service/local_service/local_ad_banner_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannereList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList = List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;

  RxBool isBannerLoading = false.obs;
  RxBool isCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;

  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  final LocalProductService _localProductService = LocalProductService();

  @override
  void onInit() async {

    await _localAdBannerService.init();
    await _localCategoryService.init();
    await _localProductService.init();


    getAdBanners();
    getPopularCategory();
    getPopularProducts();
    super.onInit();
  }

  void getAdBanners() async{
    try{
      isBannerLoading(true);
      //assigning local ad banners before call api
      if(_localAdBannerService.getAdBanners().isNotEmpty){
        bannereList.assignAll(_localAdBannerService.getAdBanners());

      }
      //call api
      var result = await RemoteBannerServices().get();
      if(result != null){
        //assign api result
        bannereList.assignAll(adBannerListFromJson(result.body));

        //save api result to local db
        _localAdBannerService.assignAllAdBanners(adBanners: adBannerListFromJson(result.body));
      }
    }finally{
     // print(bannereList.first.image);
      isBannerLoading(false);
    }
  }
  void getPopularCategory() async{
    try{
      isCategoryLoading(true);
      if(_localCategoryService.getPopularCategory().isNotEmpty){
        popularCategoryList.assignAll(_localCategoryService.getPopularCategory());
      }
      var result = await RemotePopularCategoryService().get();
      if(result != null){
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));

        _localCategoryService.assignAllPopularCategories(popularCategories: popularCategoryListFromJson(result.body));
      }
    }finally{
     // print(popularCategoryList.length);
      isCategoryLoading(false);
    }
  }
  void getPopularProducts() async{
    try{
      isPopularProductLoading(true);
      if(_localProductService.getPopularProducts().isNotEmpty){
        popularProductList.assignAll(_localProductService.getPopularProducts());
      }
      var result = await RemotePopularProductService().get();
      if(result != null){
        popularProductList.assignAll(popularProductListFromJson(result.body));

        _localProductService.assignAllPopularProducts(popularProducts: popularProductListFromJson(result.body));
      }
    }finally{
     // print(popularProductList.length);
      isPopularProductLoading(false);
    }
  }
}