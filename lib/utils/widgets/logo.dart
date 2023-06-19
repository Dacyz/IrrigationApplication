import 'package:flutter/material.dart';

class ProyectLogo extends StatelessWidget {
  const ProyectLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/image/logo.png', width: 96, height: 96),
            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Sistema de riego',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
              Text('Grupo 03',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
            ]),
          ],
        ),
      ),
    );
  }
}
