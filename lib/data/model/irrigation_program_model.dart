class IrrigationProgramHorary {
  final int initHour;
  final int initMinute;
  final int lastHour;
  final int lastMinute;

  bool get isValidTimeRange {
    final int hours = lastHour - initHour;
    final int minutes = lastMinute - initMinute;
    return hours >= 0 && minutes >= 0;
  }

  IrrigationProgramHorary({
    this.initHour = 0,
    this.lastHour = 0,
    this.initMinute = 0,
    this.lastMinute = 0,
  });
}

class IrrigationProgramDay {
  final int index;
  final String letter;
  final String name;
  IrrigationProgramHorary? horary;

  String get elapsedHours {
    if (horary != null) {
      final int hours = horary!.lastHour - horary!.initHour;
      final int minutes = horary!.lastMinute - horary!.initMinute;
      if (hours == 0 && minutes == 0) return '-';
      if (hours > 0) {
        if (minutes <= 0) {
          if (hours == 1 ) {
            return '$hours hora';
          }
          return '$hours horas';
        } else {
          return '$hours horas $minutes minutos';
        }
      } else {
        return '$minutes minutos';
      }
    }
    return '-';
  }

  IrrigationProgramDay(
    this.index, {
    required this.letter,
    required this.name,
    this.horary,
  });
}
