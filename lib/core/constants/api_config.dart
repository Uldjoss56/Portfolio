import 'package:dio/dio.dart';

class ApiConfig {
  static api() {
    final options = BaseOptions(
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      baseUrl: 'https://musicteam.princedegboe.com/api/v1/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (status) {
        // On accepte tous les statuts et on gère nous-mêmes les erreurs.
        return status! < 600;
      },
    );

    return Dio(options);
  }
}
