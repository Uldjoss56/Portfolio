import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super("fr");

  void changeLanguage(String lang) {
    FlutterLocalization.instance.translate(lang);
    emit(lang);
  }
}
