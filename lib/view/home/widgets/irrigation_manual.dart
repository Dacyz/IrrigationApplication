part of 'package:irrigation_app/view/home/irrigation_home_page.dart';

class ManualDetail extends StatefulWidget {
  const ManualDetail({
    super.key,
  });

  @override
  State<ManualDetail> createState() => _ManualDetailState();
}

class _ManualDetailState extends State<ManualDetail> {
  bool lightPower = false;
  bool irrigatePower = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: IrrigationCard(
          color: lightPower ? AppColors.selectedColor : AppColors.cardColor,
          onTap: () {
            setState(() {
              lightPower = !lightPower;
            });
          },
          child: Row(
            children: [
              Icon(
                lightPower ? Icons.lightbulb : Icons.lightbulb_outline,
                color: lightPower ? Colors.amber : Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Luz',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Text(lightPower ? 'Encendida' : 'Apagada',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        )),
        const SizedBox(width: AppQuerys.padding),
        Expanded(
            child: IrrigationCard(
          color: irrigatePower ? AppColors.selectedColor : AppColors.cardColor,
          onTap: () {
            setState(() {
              irrigatePower = !irrigatePower;
            });
          },
          child: Row(
            children: [
              Icon(
                irrigatePower ? Icons.water_drop_rounded : Icons.water_drop_outlined,
                color: irrigatePower ? Colors.blueAccent : Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Riegue',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Text(irrigatePower ? 'Encendido' : 'Apagado',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
