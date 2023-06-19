part of 'package:irrigation_app/view/home/irrigation_home_page.dart';

class IrrigationDetail extends StatelessWidget {
  const IrrigationDetail({
    super.key,
    required this.icon,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return IrrigationCard(
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text(detail,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IrrigationConnection extends StatefulWidget {
  const IrrigationConnection({
    super.key,
  });

  @override
  State<IrrigationConnection> createState() => _IrrigationConnectionState();
}

class _IrrigationConnectionState extends State<IrrigationConnection> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final connection = Provider.of<IrrigationConnectService>(context);
    return IrrigationCard(
        color: connection.isConnected
            ? AppColors.selectedColor
            : AppColors.cardColor,
        onTap: isLoading || connection.isConnected
            ? null
            : () {
                setState(() {
                  isLoading = true;
                });
                Future.delayed(
                    const Duration(seconds: 2, milliseconds: 500),
                    () => setState(() {
                          connection.connect = true;
                          isLoading = false;
                        }));
              },
        child: Row(
          children: [
            Icon(
              isLoading
                  ? Icons.change_circle_rounded
                  : connection.isConnected
                      ? Icons.bluetooth
                      : Icons.bluetooth_disabled,
              color: connection.isConnected ? Colors.blue : Colors.white,
            ),
            const SizedBox(width: 8),
            Expanded(
                child: Text(
              isLoading
                  ? 'Buscando ...'
                  : connection.isConnected
                      ? 'Conectado'
                      : 'Desconectado',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
          ],
        ));
  }
}
