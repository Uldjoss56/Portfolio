// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class FlutterSecureStorageState extends Equatable {
  final Map<String, dynamic>? loginData;
  final String? userName;
  const FlutterSecureStorageState({
    required this.loginData,
    required this.userName,
  });

  factory FlutterSecureStorageState.initial() {
    return const FlutterSecureStorageState(
        loginData: {"nada": "nada"}, userName: "");
  }

  FlutterSecureStorageState copyWith({
    Map<String, dynamic>? loginData,
    String? userName,
  }) {
    return FlutterSecureStorageState(
      loginData: loginData ?? this.loginData,
      userName: userName ?? this.userName,
    );
  }

  @override
  List<Object?> get props => [loginData];
}
