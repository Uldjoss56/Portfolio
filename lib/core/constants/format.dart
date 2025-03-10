import 'package:intl/intl.dart';

final emailRegex = RegExp(r'^[a-z0-9._%+_]+@[a-z0-9.-]+\.[a-z]{2,6}$');

final numberFormat = NumberFormat("0000");

final moneyFrFormat = NumberFormat("#,###", "fr");
final moneyEnFormat = NumberFormat("#,###", "en");

final dateFormatDH = DateFormat('dd-MM-yyyy, HH:mm');
final dateFormatH = DateFormat('HH:mm');
final dateFormatM = DateFormat('mm:ss');

final dateFormatD = DateFormat('dd-MM-yyyy');

final birthdayFormat = DateFormat('dd/MM/yyyy');

final audioDurationFormat = DateFormat('HH:mm:ss');

final audioNameDateFormat = DateFormat('HHmmss');

String formatAudioDuration(Duration duration) {
  int totalSeconds = duration.inSeconds;

  int hours = totalSeconds ~/ 3600;
  int minutes = (totalSeconds ~/ 60) % 60;
  int seconds = totalSeconds % 60;

  String formattedDuration = '${hours.toString().padLeft(2, '0')}:'
      '${minutes.toString().padLeft(2, '0')}:'
      '${seconds.toString().padLeft(2, '0')}';

  return formattedDuration;
}

bool compareDates(DateTime date1, DateTime date2) {
  DateTime dat = DateTime(date1.year, date1.month, date1.day);
  DateTime date = DateTime(date2.year, date2.month, date2.day);
  return date.compareTo(dat) == 1;
}

final weekDays = {
  7: "dim",
  1: "lun",
  2: "mar",
  3: "mer",
  4: "jeu",
  5: "ven",
  6: "sam",
};

final yearMonths = {
  0: "janvier",
  1: "février",
  2: "mars",
  3: "avril",
  4: "mai",
  5: "juin",
  6: "juillet",
  7: "août",
  8: "septembre",
  9: "octobre",
  10: "novembre",
  11: "décembre",
};

String dateOtherFormat(DateTime date) {
  return "${weekDays[date.weekday]}, ${date.day} "
      "${yearMonths[date.month - 1]} ${date.year}";
}

String otherDateFormat(DateTime date) {
  return "${date.day} ${yearMonths[date.month - 1]} ${date.year}, à ${dateFormatH.format(date)}";
}
