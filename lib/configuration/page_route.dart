import 'package:get/get.dart';
import 'package:interview_task/controller/category_controller.dart';
import 'package:interview_task/controller/home_controller.dart';
import 'package:interview_task/View/home_screen.dart';
import 'package:interview_task/view/category_screen.dart';

class Routes {
  static const String homepage = '/homepage';
  static const String categorypage = '/categorypage';

  static List<GetPage<dynamic>> get getPages {
    return [
      GetPage(
        name: Routes.homepage,
        page: () => const HomeScreen(),
        binding: BindingsBuilder.put(
          () => HomeController(),
          // permanent: true,
        ),
        transition: Transition.cupertino,
      ),
      GetPage(
        name: Routes.categorypage,
        page: () => const CategoryScreen(),
        binding: BindingsBuilder.put(
          () => CategoryScreenController(),
          // permanent: true,
        ),
        transition: Transition.cupertino,
      ),
    ];
  }
}
