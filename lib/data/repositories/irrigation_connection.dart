import 'package:flutter/material.dart';

class IrrigationConnectService with ChangeNotifier {
  bool _power = false;

  bool get isConnected => _power;

  set connect(bool wa) {
    _power = wa;
    notifyListeners();
  }
}
