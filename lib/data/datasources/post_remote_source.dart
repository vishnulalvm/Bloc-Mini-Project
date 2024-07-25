import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/data/models/post_model.dart';

abstract class PostRemoteSource {
  Future<List<PostModel>> getPostFromApi();
}

class PostRemoteSourceImpl implements PostRemoteSource {
  final client = http.Client();
  @override
  Future<List<PostModel>> getPostFromApi() async {
    try {
      final responce = await client.get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          headers: {'Content-Type': 'application/json'});
      if (responce.statusCode == 200) {
        final List<dynamic> respondBody = jsonDecode(responce.body);
        final List<PostModel> posts =
            respondBody.map((json) => PostModel.fromJson(json)).toList();
        return posts;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
