import 'package:flutter/material.dart';

class IrrigationCard extends StatelessWidget {
  const IrrigationCard({
    super.key,
    required this.child,
    this.onTap,
    this.color = const Color(0x805A5A5A),
    this.onLongPress,
  });
  final Widget child;
  final Color color;
  final void Function()? onTap;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => false,
      onLongPress: onLongPress,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Material(
        elevation: 1,
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
