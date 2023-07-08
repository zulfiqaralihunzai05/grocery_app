import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/model/ad_banner.dart';
import 'package:grocery_app/model/category.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/route/app_page.dart';
import 'package:grocery_app/route/app_route.dart';
import 'package:grocery_app/theme/app_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();


  //register adaptor
  Hive.registerAdapter(AdBannerAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
