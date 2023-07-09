import 'package:get/get.dart';
import 'package:grocery_app/service/local_service/local_category_service.dart';
import 'package:grocery_app/service/remote_service/remote_category_service.dart';
import '../model/category.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() async {
    await _localCategoryService.init();
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    try {
      isCategoryLoading(true);
      if (_localCategoryService.getCategories().isNotEmpty) {
        categoryList.assignAll(_localCategoryService.getCategories());
      }

      var result = await RemoteCategoryServices().get();
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
        _localCategoryService.assignAllCategories(
            categories: categoryListFromJson(result.body));
      }
    } finally {
      isCategoryLoading(false);
      print(categoryList.length);
    }
  }
}
