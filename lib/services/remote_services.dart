import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latihan_slicing/global/api.dart';
import 'package:latihan_slicing/model/job_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<JobModel>> fetchData() async {
    try {
      print('fetching...');

      var response = await client.get(Uri.parse(Api.baseURL));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return jobFromJson(jsonString);
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future login(String email, String password) async {
    try {
      print('fetching...');

      var response = await client.post(
        Uri.parse("http://pengaduan.devliffe.com/api/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return;
      } else {
        print(response.body);
        // return "error";
      }
    } catch (e) {
      print(e);
    }
  }

  static Future doRegister(String email, String nm_pengguna, String password,
      String telepon, String alamat) async {
    try {
      var response = await client.post(
        Uri.parse("http://pengaduan.devliffe.com/api/register"),
        headers: <String, String>{
          'Content-Type': 'multipart/form-data',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'nm_pelapor': nm_pengguna,
          'telepon': telepon,
          'alamat': alamat,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return;
      } else {
        print(response.body);
        // return "error";
      }
    } catch (e) {
      print(e);
    }
  }
}
