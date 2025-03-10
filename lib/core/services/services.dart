import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

const staticPath = "assets/img/africa_flag/";

Future<String> uploadFileV2({
  required String destination,
  required File file,
  required Function(double) onProgress,
}) async {
  // final ref = FirebaseStorage.instance.ref(destination);
  // final uploadTask = ref.putFile(file);

  // uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
  //   final progress = snapshot.bytesTransferred / snapshot.totalBytes;
  //   onProgress(progress);
  // });

  // final snapshot = await uploadTask;
  // return await snapshot.ref.getDownloadURL();
  return "";
}

downloadFile(String imgUrl, String savePath) async {
  Dio dio = Dio();

  await dio.download(
    imgUrl,
    savePath,
  );
}

getFileSize(String filePath) async {
  File file = File(filePath);

  try {
    int fileSizeInBytes = await file.length();
    double fileSizeInKB = fileSizeInBytes / 1024;
    double fileSizeInMB = fileSizeInKB / 1024;
    return fileSizeInMB;
  } catch (e) {
    return "Error";
  }
}

Future<List<Map<String, dynamic>>> fetchCountries() async {
  const String apiUrl = 'https://restcountries.com/v3.1/all';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((country) {
      return {
        "img": "$staticPath${country['cca2'].toLowerCase()}.png",
        "noum": country['name']['common'],
        "key": country['cca2'].toLowerCase(),
      };
    }).toList();
  } else {
    return [
      {
        "img": "assets/img/africa_flag/benin.png",
        "noum": "Benin",
        "key": "bj",
      }
    ];
  }
}

const String apiUrl = 'https://api.api-ninjas.com/v1/country';
const String apiKey = '7ynGuJJAmbYN2hjkWXaXxQ==90QJFJ7FpYqjECnl';

Future<List<Map<String, dynamic>>> anotherFetchCountries() async {
  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {'X-Api-Key': apiKey},
  );

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data
        .map((country) => {
              "img":
                  "$staticPath${country['name'].toLowerCase().replaceAll(' ', '-')}.png",
              "noum": country['name'],
              "key": country['alpha2Code'].toLowerCase(),
            })
        .toList();
  } else {
    return [
      {
        "img": "assets/img/africa_flag/benin.png",
        "noum": "Benin",
        "key": "bj",
      }
    ];
  }
}
