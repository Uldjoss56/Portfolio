import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingStepCubit extends Cubit<int> {
  OnboardingStepCubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  void defineStep(int step) {
    emit(step);
  }
}
