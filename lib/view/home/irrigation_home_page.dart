import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:irrigation_app/data/model/irrigation_function_model.dart';
import 'package:irrigation_app/data/model/irrigation_program_model.dart';
import 'package:irrigation_app/utils/colors.dart';
import 'package:irrigation_app/utils/heros.dart';
import 'package:irrigation_app/utils/querys.dart';
import 'package:irrigation_app/utils/widgets/card.dart';
import 'package:irrigation_app/utils/widgets/logo.dart';
import 'package:irrigation_app/utils/widgets/selector.dart';
import 'package:irrigation_app/data/repositories/irrigation_connection.dart';
import 'package:provider/provider.dart';

part 'package:irrigation_app/view/home/widgets/irrigation_details.dart';
part 'package:irrigation_app/view/home/widgets/irrigation_automatic.dart';
part 'package:irrigation_app/view/home/widgets/irrigation_manual.dart';
part 'package:irrigation_app/view/home/widgets/irrigation_program.dart';
part 'package:irrigation_app/view/home/widgets/irrigation_stadistic.dart';

class IrrigationHome extends StatefulWidget {
  const IrrigationHome({super.key});
  static const String route = '/IrrigationHome';

  @override
  State<IrrigationHome> createState() => _IrrigationHomeState();
}

class _IrrigationHomeState extends State<IrrigationHome> {
  final List<IrrigationFunctions> w = [
    IrrigationFunctions(0, title: 'Automatico', page: const AutomaticDetail()),
    IrrigationFunctions(1, title: 'Manual', page: const ManualDetail()),
    IrrigationFunctions(2, title: 'Programado', page: const ProgramDetail()),
    IrrigationFunctions(3,
        title: 'Estadisticas', page: const StadisticDetail()),
  ];

  int currentSelection = 0;

  @override
  Widget build(BuildContext context) {
    final connection = Provider.of<IrrigationConnectService>(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/gif/background_2.gif', fit: BoxFit.cover),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 3.0,
            sigmaY: 3.0,
          ),
          child: Container(color: Colors.transparent),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(AppQuerys.padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: AppHeroes.logoHero,
                          child: ProyectLogo(),
                        ),
                        IrrigationConnection(),
                      ],
                    ),
                  ),
                  ...connection.isConnected
                      ? [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppQuerys.padding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: IrrigationDetail(
                                            icon: Icons.air,
                                            title: 'Aire',
                                            detail: '35 *C')),
                                    SizedBox(width: AppQuerys.padding),
                                    Expanded(
                                        child: IrrigationDetail(
                                            icon: Icons.grass,
                                            title: 'Suelo',
                                            detail: '24 *C')),
                                  ],
                                ),
                                SizedBox(height: AppQuerys.padding),
                                IrrigationDetail(
                                    icon: Icons.device_thermostat_sharp,
                                    title: 'Temperatura',
                                    detail: '23 *C'),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppQuerys.padding),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppQuerys.padding),
                            child: Row(
                              children: [
                                ...w
                                    .map((e) => Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: IrrigationPageSelector(
                                            elevation: 1,
                                            color: e.index == currentSelection
                                                ? AppColors.selectedColor
                                                : AppColors.cardColor,
                                            onTap: () => setState(() =>
                                                currentSelection = e.index),
                                            text: e.title,
                                          ),
                                        ))
                                    .toList(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppQuerys.padding),
                            child: w[currentSelection].page,
                          ),
                        ]
                      : [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppQuerys.padding),
                            child: IrrigationCard(
                              child: Row(
                                children: [
                                  Icon(Icons.info),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                        'Conectate al dispositivo de riegue para poder visualizar todos los datos.',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
