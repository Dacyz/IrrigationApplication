part of 'package:irrigation_app/view/home/irrigation_home_page.dart';

class StadisticDetail extends StatelessWidget {
  const StadisticDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const IrrigationCard(
      child: Row(
        children: [
          Icon(Icons.info),
          SizedBox(width: 8),
          Expanded(
            child: Text(
                'En estos momentos aún no disponemos de esta función.',
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
