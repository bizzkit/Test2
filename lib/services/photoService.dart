import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/photoModel.dart';


class PhotoService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  static Future<List<Photo>> getPhotos() async {
    try {
      final response = await Dio().get(baseUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Photo.fromJson(json)).toList().cast<Photo>();
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}