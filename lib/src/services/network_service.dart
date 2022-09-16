import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_project_manage/src/models/post_model.dart';

class NetworkService {
  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() => _instance;

  static final _dio = Dio();

  Future<List<Post>> fetchPosts(int startIndex, {int limit = 50}) async {
    // https://jsonplaceholder.typicode.com/posts?_start=0&_limit=10
    final url =
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit';
    // Uri.https('jsonplaceholder.typicode.com', 'posts?_start=0&_limit=10');
    final Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      return postFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }
}
