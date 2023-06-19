part of 'package:irrigation_app/view/home/irrigation_home_page.dart';

class AutomaticDetail extends StatelessWidget {
  const AutomaticDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: IrrigationCard(
                color: AppColors.selectedColor,
                child: Row(
                  children: [
                    Icon(Icons.lightbulb, color: Colors.amber,),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text('Luz',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: IrrigationCard(
                child: Row(
                  children: [
                    Icon(
                      Icons.water_drop_outlined,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text('Riegue',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        const IrrigationCard(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.info),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                        'En estos momentos el sistema se encuentra en modo automatico.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                  'El sistema apagará o encenderá lo necesario para cuidar tu huerto, tomará en cuenta las condiciones tomadas por lo sensores.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}
