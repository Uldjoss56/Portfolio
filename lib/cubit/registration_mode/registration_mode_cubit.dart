import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationModeCubit extends Cubit<String> {
  RegistrationModeCubit() : super("login");

  void setMode(String choice) { // Les modes possible sont login et register
    emit(choice);
  }
}
