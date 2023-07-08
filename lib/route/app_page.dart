import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:grocery_app/route/app_route.dart';
import 'package:grocery_app/view/dashboard/dashboardScreen.dart';
import 'package:grocery_app/view/dashboard/dashboard_binding.dart';

class AppPage {
  static var list = [
    GetPage(name: AppRoute.dashboard,
        page: () => DashboardScreen(),
        binding: DashboardBinding()
    )
  ];
}