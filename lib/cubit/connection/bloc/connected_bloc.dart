// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connected_event.dart';
part 'connected_state.dart';

/*
class ConnectedBloc extends Bloc<ConnectedEvent, ConnectedState> {
  StreamSubscription? subscription;
  ConnectedBloc() : super(ConnectedInitialState()) {
    on<ConnectedEvent>(
      (event, emit) => emit(
        ConnectedSucessState(),
      ),
    );
    on<OnNotConnectedEvent>(
      (event, emit) => emit(
        ConnectedFailureState(),
      ),
    );

    subscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.ethernet)) {
          add(
            OnConnectedEvent(),
          );
        } else {
          add(
            OnNotConnectedEvent(),
          );
        }
      },
    );
  }
}
*/

class ConnectedBloc extends Bloc<ConnectedEvent, ConnectedState> {
  StreamSubscription? subscription;

  ConnectedBloc() : super(ConnectedInitialState()) {
    // Vérifier la connectivité initiale
    _checkInitialConnectivity();

    // Écoute des changements de connectivité
    subscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        if (_isConnected(result)) {
          add(OnConnectedEvent());
        } else {
          add(OnNotConnectedEvent());
        }
      },
    );

    on<OnConnectedEvent>((event, emit) => emit(ConnectedSuccessState()));
    on<OnNotConnectedEvent>((event, emit) => emit(ConnectedFailureState()));
  }

  Future<void> _checkInitialConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    if (_isConnected(result)) {
      add(OnConnectedEvent());
    } else {
      add(OnNotConnectedEvent());
    }
  }

  bool _isConnected(List<ConnectivityResult> result) {
    return result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet);
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
