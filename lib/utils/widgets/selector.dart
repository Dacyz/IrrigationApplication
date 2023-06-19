
import 'package:flutter/material.dart';
import 'package:irrigation_app/utils/colors.dart';

class IrrigationPageSelector extends StatelessWidget {
  const IrrigationPageSelector({
    super.key,
    this.color = const Color(0x805A5A5A),
    this.onTap,
    required this.text,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
  });

  const IrrigationPageSelector.byCategory({
    super.key,
    this.color = const Color.fromARGB(255, 148, 148, 148),
    this.onTap,
    required this.text,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
  });

  final Color? color;
  final String text;
  final double elevation;
  final EdgeInsets padding;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: elevation,
      borderRadius: const BorderRadius.all(Radius.circular(54)),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(54)),
        child: Padding(
          padding: padding,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColors.foregroundColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}