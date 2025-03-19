import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollCubit extends Cubit<ItemScrollController> {
  ScrollCubit() : super(ItemScrollController());

  void jumpTo(int index) {
    state.scrollTo(
      index: index,
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.easeInOut,
    );
  }
}

class SelectedIndexCubit extends Cubit<int> {
  SelectedIndexCubit() : super(0);

  void selectIndex(int index) => emit(index);
}

class DrawerCubit extends Cubit<GlobalKey<ScaffoldState>> {
  DrawerCubit()
      : super(
          GlobalKey<ScaffoldState>(),
        );

  void openDrawer() {
    state.currentState?.openDrawer();
  }

  void closeDrawer() {
    state.currentState?.closeDrawer();
  }
}
