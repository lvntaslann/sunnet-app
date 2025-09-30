import 'package:flutter/material.dart';
import 'package:sunnet_app/features/hadis/presentation/page/hadis_page.dart';
import 'package:sunnet_app/features/main_page_controller.dart';
import 'package:sunnet_app/features/namaz/presentation/page/namaz_page.dart';

import '../utils/page_transition.dart';


class Routes {
  static const String main = "/main_page";
  static const String namaz = "/namaz";
  static const String hadis = "/hadis";
  static final Map<String, Widget> _routes = {
    main: const MainPageController(),
    namaz: const NamazPage(),
    hadis: const HadisPage(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Widget? page = _routes[settings.name];

    if (page != null) {
      return pageTransition(page);
    }

    return pageTransition(
      const Scaffold(
        body: Center(child: Text("Route not found")),
      ),
    );
  }
}
