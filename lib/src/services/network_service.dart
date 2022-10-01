import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_project_manage/src/constanrs/api.dart';
import 'package:flutter_project_manage/src/models/post_model.dart';
import 'package:flutter_project_manage/src/models/product.dart';
import 'package:http_parser/http_parser.dart';

class NetworkService {
  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() => _instance;

  static final _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.baseUrl = API.basesUrl;
          options.connectTimeout = 5000;
          options.receiveTimeout = 3000;

          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          return handler.next(response); // continue
        },
        onError: (DioError err, handler) {
          return handler.next(err); //continue
        },
      ),
    );

  Future<List<Product>> getAllProduct() async {
    const url = API.productsUrl;
    final Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      return productFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<String> addProduct( Product product,{File? imageFile}) async {
    const url = API.productsUrl;
    FormData data = FormData.fromMap({
      'name': product.name,
      'price': product.price,
      'stock': product.stock,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final Response response = await _dio.post(url, data: data);
    if (response.statusCode == 201) {
      return 'Add Successfully';
    }
    throw Exception('Network failed');
  }

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
