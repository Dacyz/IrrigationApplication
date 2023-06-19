import 'package:flutter/material.dart';
import 'package:irrigation_app/data/repositories/irrigation_connection.dart';
import 'package:irrigation_app/utils/colors.dart';
import 'package:irrigation_app/utils/route.dart';
import 'package:irrigation_app/view/irrigation_splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IrrigationConnectService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black87,
            colorScheme:
                const ColorScheme.light(background: AppColors.backgroundColor),
            iconTheme: const IconThemeData(color: AppColors.foregroundColor),
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: AppColors.foregroundColor,
                  displayColor: AppColors.foregroundColor,
                  decorationColor: AppColors.foregroundColor,
                  // fontFamily: AppFonts.roboto,
                )),
        home: const IrrigationSplash(),
        routes: AppRoutes.routes,
      ),
    );
  }
}
