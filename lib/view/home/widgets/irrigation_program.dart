part of 'package:irrigation_app/view/home/irrigation_home_page.dart';

class ProgramDetail extends StatefulWidget {
  const ProgramDetail({super.key});

  @override
  State<ProgramDetail> createState() => _ProgramDetailState();
}

class _ProgramDetailState extends State<ProgramDetail> {
  List<IrrigationProgramDay> wa = [
    IrrigationProgramDay(0, letter: 'D', name: 'Domingo'),
    IrrigationProgramDay(0, letter: 'L', name: 'Lunes'),
    IrrigationProgramDay(0, letter: 'M', name: 'Martes'),
    IrrigationProgramDay(0, letter: 'M', name: 'Miercoles'),
    IrrigationProgramDay(0, letter: 'J', name: 'Jueves'),
    IrrigationProgramDay(0, letter: 'V', name: 'Viernes'),
    IrrigationProgramDay(0, letter: 'S', name: 'Sabado'),
  ];

  int currentSelection = 0;

  int currentInitHour = 0;
  int currentLastHour = 0;
  int currentInitMinute = 0;
  int currentLastMinute = 0;

  String get formattedInitTime {
    final String hour = currentInitHour.toString().padLeft(2, '0');
    final String minute = currentInitMinute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String get formattedLastTime {
    final String hour = currentLastHour.toString().padLeft(2, '0');
    final String minute = currentLastMinute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 50,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => IrrigationCard(
                    onTap: () => setState(() {
                          currentSelection = index;
                          currentInitHour =
                              wa[currentSelection].horary?.initHour ?? 0;
                          currentInitMinute =
                              wa[currentSelection].horary?.initMinute ?? 0;
                          currentLastHour =
                              wa[currentSelection].horary?.lastHour ?? 0;
                          currentLastMinute =
                              wa[currentSelection].horary?.lastMinute ?? 0;
                        }),
                    color: index == currentSelection
                        ? AppColors.selectedColor
                        : AppColors.cardColor,
                    child: Text(
                      wa[index].letter,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    )),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: wa.length),
          ),
        ),
        SizedBox(height: 16),
        Center(
          child: FittedBox(
            child: Row(
              children: [
                Column(
                  children: [
                    IrrigationCard(
                      child: Icon(Icons.keyboard_double_arrow_left),
                      onTap: () {
                        if (currentInitHour > 0) {
                          setState(() {
                            currentInitHour--;
                          });
                        } else {
                          setState(() {
                            currentInitHour = 23;
                          });
                        }
                      },
                    ),
                    SizedBox(height: 8),
                    IrrigationCard(
                      child: Icon(Icons.keyboard_arrow_left),
                      onTap: () {
                        if (currentInitMinute > 0) {
                          setState(() {
                            currentInitMinute--;
                          });
                        } else {
                          setState(() {
                            currentInitMinute = 59;
                          });
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Text('Inicio',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Text(formattedInitTime,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    IrrigationCard(
                      child: Icon(Icons.keyboard_double_arrow_right),
                      onTap: () {
                        if (currentInitHour < 23) {
                          setState(() {
                            currentInitHour++;
                          });
                        } else {
                          setState(() {
                            currentInitHour = 0;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    IrrigationCard(
                      child: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        if (currentInitMinute < 59) {
                          setState(() {
                            currentInitMinute++;
                          });
                        } else {
                          setState(() {
                            currentInitMinute = 0;
                          });
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    IrrigationCard(
                      child: Icon(Icons.keyboard_double_arrow_left),
                      onTap: () {
                        if (currentLastHour > 0) {
                          setState(() {
                            currentLastHour--;
                          });
                        } else {
                          setState(() {
                            currentLastHour = 23;
                          });
                        }
                      },
                    ),
                    SizedBox(height: 8),
                    IrrigationCard(
                      child: Icon(Icons.keyboard_arrow_left),
                      onTap: () {
                        if (currentLastMinute > 0) {
                          setState(() {
                            currentLastMinute--;
                          });
                        } else {
                          setState(() {
                            currentLastMinute = 59;
                          });
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Text('Fin',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Text(formattedLastTime,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    IrrigationCard(
                      child: Icon(Icons.keyboard_double_arrow_right),
                      onTap: () {
                        if (currentLastHour < 23) {
                          setState(() {
                            currentLastHour++;
                          });
                        } else {
                          setState(() {
                            currentLastHour = 0;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    IrrigationCard(
                      child: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        if (currentLastMinute < 59) {
                          setState(() {
                            currentLastMinute++;
                          });
                        } else {
                          setState(() {
                            currentLastMinute = 0;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
                child: IrrigationCard(
                    onTap: () => setState(() {
                          currentInitHour = 0;
                          currentInitMinute = 0;
                          currentLastHour = 0;
                          currentLastMinute = 0;
                        }),
                    child: Text(
                      'Reiniciar',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ))),
            SizedBox(width: 16),
            Expanded(
                child: IrrigationCard(
                    onTap: () => setState(() {
                          final newHorary = IrrigationProgramHorary(
                              initHour: currentInitHour,
                              lastHour: currentLastHour,
                              initMinute: currentInitMinute,
                              lastMinute: currentLastMinute);
                          if (!newHorary.isValidTimeRange) return;
                          wa[currentSelection].horary = newHorary;
                        }),
                    color: AppColors.selectedColor,
                    child: Text(
                      'Guardar',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ))),
          ],
        ),
        SizedBox(height: 16),
        IrrigationCard(
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Row(
                    children: [
                      Text(
                        wa[index].name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                        wa[index].elapsedHours,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
              separatorBuilder: (context, index) => const Divider(
                    height: 8,
                    color: Colors.white,
                  ),
              itemCount: wa.length),
        )
      ],
    );
  }
}
