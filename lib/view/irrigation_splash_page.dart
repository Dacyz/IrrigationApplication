import 'package:flutter/material.dart';
import 'package:irrigation_app/utils/colors.dart';
import 'package:irrigation_app/utils/heros.dart';
import 'package:irrigation_app/utils/widgets/logo.dart';
import 'package:irrigation_app/view/home/irrigation_home_page.dart';

class IrrigationSplash extends StatefulWidget {
  const IrrigationSplash({super.key});
  static const String route = '/IrrigationSplash';

  @override
  State<IrrigationSplash> createState() => _IrrigationSplashState();
}

class _IrrigationSplashState extends State<IrrigationSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool finishInit = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          Navigator.pushNamed(context, IrrigationHome.route);
        }
      });
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: GestureDetector(
                onTap: () => finishInit
                    ? Navigator.pushNamed(context, IrrigationHome.route)
                    : false,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) => Opacity(
                    opacity: 1 * _animationController.value,
                    child: child,
                  ),
                  child: const Hero(
                    tag: AppHeroes.logoHero,
                    child: ProyectLogo(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
