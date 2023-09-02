import 'dart:io';
import 'package:banking_dev_app/db/urls.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../data_model/Model.dart';

class ApiService {
  final Dio _dio = Dio();
  Urls urls = Urls();
  ApiService() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options.baseUrl =
        '${urls.basrUrl}'; // Replace with your SQL Server URL

    // Configure Dio to accept all certificates temporarily
    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true; // Temporarily accepting all certificates
        };
        return client;
      },
    );
  }

  Future<List<MyData>> fetchData() async {
    try {
      final response = await _dio.get(urls.basrUrl + urls.getAllurls);
      if (response.statusCode == 200) {
        final data = response.data as List;
        return data
            .map((json) => MyData(
                  id: json['ID'],
                  imgUrl: json['img_url'],
                  title: json['title'],
                  content: json['content'],
                  description: List<String>.from(json['Description']),
                  screenRoute: json['ScreenRoute'],
                ))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }

  Future<List<CardData>> fetchCardData(int id) async {
    try {
      final response = await _dio.get('${urls.basrUrl}${urls.getCardUrls}$id');
      if (response.statusCode == 200) {
        final data = response.data as List;
        if (data == null) {
          throw Exception('Card data is null');
        }
        return data
            .map((json) => CardData(
                  id: json['id'] ??
                      0, // Use a default value or handle null as needed
                  homeId: json['home_id'] ?? '',
                  title: json['title'] ?? '',
                  data: json['data'] ?? '',
                  features: List<String>.from(json['features']) ?? [],
                ))
            .toList();
      } else {
        throw Exception('Failed to load card data');
      }
    } catch (error) {
      throw Exception('Failed to load card data: $error');
    }
  }

  Future<List<FundData>> fetchFundData(int id) async {
    try {
      final response =
          await _dio.get('${urls.basrUrl}${urls.getFundbyselectId}$id');
      if (response.statusCode == 200) {
        final data = response.data as List;
        if (data == null) {
          throw Exception('Card data is null');
        }
        return data
            .map((json) => FundData(
                  id: json['id'] ??
                      0, // Use a default value or handle null as needed
                  selectId: json['selectId'] ?? '',
                  screenRoute: json['screenRoute'] ?? '',
                  items: List<String>.from(json['items']) ?? [],
                ))
            .toList();
      } else {
        throw Exception('Failed to load card data');
      }
    } catch (error) {
      throw Exception('Failed to load card data: $error');
    }
  }

   Future<bool> insertUserData(UserData userData) async {
    try {
      final response = await _dio.post(urls.basrUrl + urls.insertUserData,
         // Replace with your API endpoint
        data: {
          'deviceId': userData.deviceId,
          'amount': userData.amount,
          'item': userData.item,
        },
      );

      if (response.statusCode == 200) {
        // Data was successfully inserted
        return true;
        print("inserted");
      } else {
        // Handle errors or failed insertions here
        return false;
      }
    } catch (error) {
      // Handle Dio errors or exceptions here
      print('Error inserting data: $error');
      return false;
    }
  }
}
