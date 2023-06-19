import 'package:flutter/material.dart';
import 'package:irrigation_app/view/home/irrigation_home_page.dart';
import 'package:irrigation_app/view/irrigation_splash_page.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext _)> routes = {
    IrrigationHome.route: (_) => const IrrigationHome(),
    IrrigationSplash.route: (_) => const IrrigationHome(),
  };

  static Route<dynamic> generateRoute(RouteSettings stgs) {
    final builder = routes[stgs.name] ?? (_) => const IrrigationSplash();
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1200),
      pageBuilder: (_, __, ___) => builder(_),
    );
  }
}