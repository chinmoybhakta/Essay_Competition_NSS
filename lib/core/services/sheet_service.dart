// import 'package:gsheets/gsheets.dart';

// class GoogleSheetsService {
//   static const sheetID =
//       "10vavMa94mzTbS1hk-IE7JRRFdyvBCloV32RtmySR4EI";

//   static const _credentials = '''
//   "type": "service_account",
//   "project_id": "adept-now-473215-s1",
//   "private_key_id": "8c74024edfc261298485b5dac8eabfa190841e44",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDXd6fmLYp28kQz\nDf0PyY4ePg8tJIoKxLhus+mHMYZG95IZw5/fcKlyeEQJAVBU6Km74mZ6qJAWRzV7\nZ8gfT8bxReXrEwzUFpgJIVYw9pkiQEMGFDdrg8I+JQruDjpCpzE5DAFVK2JEEn1b\nU5FltxXripXKxgF8AKzil72N2xcFb7iLin2lKBWl9FLK9l0kWi6LHczvvGUbF22P\nYr0CXoRmGFx2GNIzUcEpVXBXW4tXkpl33NRap0XH8dTtVds79G//xHDHfr04dqJn\nKFTY0JX6gs8y/T7+pK8NsMtopisZ/tTMtuOT4jnkWZhsVV6kXC583SQemDnQoOGj\nT3n2De+hAgMBAAECggEAFbN+0kINS27vINfsgFCOjcvg/2z0skz0k8HEaCdmx3MG\ni1hr8QyJzyD/Hou7/tvywcegXAOU2jQ7K2iye+TZu/yMQaGI4zuQqIAWYZa/VEx1\n86t0QXyNwxs7/z9TmC76rYI2CCahyQq2XCJjPIQKIyUGx9uAKXBv+TUglE8CrJCl\nWe7sWdpFl5QKc6y/4un9ZDmv6cIaFRqNLtyAuNrxgWUm3eHezvEka7113gqEWxi5\nzsgZ42HUC57t2XrSriPl7wEG4sihceZYkreY5Z54t2pECUpmJiVxQtCuVSE6Ils0\nBZug1bi6XwLBn5kC5f2JqRLdz48LqnLTimCWs+RneQKBgQD0KN/z00hdiBAbIBKe\nMEqb3PdlVeMxpXa078n2Ej+VEJjWGaRyiHInoB8FiUU0vjW1DOHTDvBlGSmkYIcO\nLr2uRiNQEZd9ZKN38nlbcRSXJT1G2s3UdufulRiPyx1k446TDQ6ia3mwmNo5Qkmb\nLH5zve3+49SqJVsZGCq0n/3J1wKBgQDh6pSTWz+WvhVeVU+8y2TpZJLkF9gRzMoh\nnxeDbVQUrsd4zGHiwGnTG99MPJtM1yscO/O2q2sXFEfV1NejNIS1qsbUfpcc4B1U\nCu0LJZ6IUE7WDxLQt73pmRJvdsRz2gdyqZ2cTKzlWjEUw0upB8oXrKIwibh/wulm\ngLFcDtATRwKBgQCGTDVjGEQlrkGtqeaTvFxNfy1VP/jHxguVWo/sGf1/MLHgkhoy\nJXsk8J4fnXHDoRxJidxtCzqPYVfWYoHm+y66PToPQJ3jCwgfYe/+rCR3PrSF1LSC\nuSS5xqjL7x0r8T7rA7OZAyTcTjc6Z4u1HrQvVbkjCo5fSEzjcLeMwrQF4QKBgQDX\n6MN6WVjajmwJrer4+kJFNJOWXptn15rOqydjuhcDdU66Skq61T3OPvMX/0xFEdbn\nsvxm9kjw07cby8ES/1xd6wr/hsSRGjetXIvTfW6XxHiz59AJnbFpEZwm3xE9z4AS\nu7wf5r/OqnYB6+vhbcpc+eZAET89C2DZT+ExpA6EfQKBgEjV+XjNxZf+GhOLJJ5l\nJP0SI5JwbrS0Bjr8/85TyYcGawVu2OL6Z99tsrHellyZ6AFpcg7Xal9umdh2oxrT\nZnxoHD23eeAXjRpQjOoeQAHe4pPFtDJ0ChGz9m6VL78MOicdu4wfRpqC+0ugu84J\nYCGiW7o7TcGlgmz/5h+5hHDG\n-----END PRIVATE KEY-----\n",
//   "client_email": "niterreligiousclub@adept-now-473215-s1.iam.gserviceaccount.com",
//   "client_id": "116381972421811511788",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/niterreligiousclub%40adept-now-473215-s1.iam.gserviceaccount.com",
//   "universe_domain": "googleapis.com"
//   ''';

//   final GSheets _gsheets = GSheets(_credentials);
//   Spreadsheet? _spreadsheet;
//   Worksheet? _worksheet;

//   /// Initialize spreadsheet and worksheet
//   Future<void> init() async {
//     _spreadsheet = await _gsheets.spreadsheet(sheetID);

//     _worksheet = _spreadsheet!.worksheetByTitle('Sheet1') ??
//         await _spreadsheet!.addWorksheet('Sheet1');
//   }

//   /// Add participant + essay data
//   Future<void> addData({
//     required String name,
//     required String id,
//     required String email,
//     required String batch,
//     required String department,
//     required String mobile,
//     required String essay,
//   }) async {
//     if (_worksheet == null) {
//       throw Exception("GoogleSheetsService not initialized");
//     }

//     await _worksheet!.values.appendRow([
//       DateTime.now().toIso8601String(), // Timestamp
//       name,
//       id,
//       email,
//       batch,
//       department,
//       mobile,
//       essay,
//     ]);
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'package:eassy_competition/data/models/data_model.dart';
import 'package:http/http.dart' as http;

class SheetService {
  Future<bool> submitEssay(DataModel data, String essay) async {
    try {
      const String apiUrl = "https://script.google.com/macros/s/AKfycbzYK54EtkXrtdtPp9RlOj49wVZBqafxTKB49Si4CyGRzW9jUgEo9Z8txaG7ng3NV3oR/exec";
      
      // final Map<String, String> headers = {
      //   "Content-Type": "application/json",
      // };
      
      final Map<String, dynamic> body = {
        "name": data.name,
        "id": data.id,
        "email": data.email,
        "batch": data.batch,
        "department": data.department,
        "mobile": data.mobile,
        "essay": essay,
      };

      log("📤 Sending request to: $apiUrl");
      log("📝 Request body: $body");

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: null,
        body: jsonEncode(body),
      ).timeout(Duration(seconds: 30));

      log("📥 Response status: ${response.statusCode}");
      log("📥 Response body: ${response.body}");

      if (response.statusCode == 200) {
        try {
          final result = jsonDecode(response.body);
          log("✅ Parsed response: $result");
          
          if (result["status"] == "success") {
            return true;
          } else {
            log("❌ API returned error: ${result["message"]}");
            return false;
          }
        } catch (e) {
          log("❌ JSON parsing error: $e");
          return false;
        }
      } else {
        log("❌ HTTP error: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      log("❌ Submission error: $e");
      return false;
    }
  }
  
  // Optional: Test connection
  Future<bool> testConnection() async {
    try {
      const String apiUrl = "https://script.google.com/macros/s/AKfycbzYK54EtkXrtdtPp9RlOj49wVZBqafxTKB49Si4CyGRzW9jUgEo9Z8txaG7ng3NV3oR/exec";
      
      final response = await http.get(
        Uri.parse(apiUrl),
      ).timeout(Duration(seconds: 10));
      
      log("Test response: ${response.statusCode} - ${response.body}");
      return response.statusCode == 200;
    } catch (e) {
      log("Connection test failed: $e");
      return false;
    }
  }
}
