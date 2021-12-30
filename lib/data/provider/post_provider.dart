import 'dart:convert';
import 'package:infinite_list/data/models/post.dart';
import 'package:http/http.dart' as http;

class PostProvider {
  Future<List<Post>> getPost(int start, int limit) async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts?_start=' +
        start.toString() +
        '&_limit=' +
        limit.toString());
    final response = await http.get(url);
    final result = json.decode(response.body) as List;
    final post = result.map((e) => Post.fromJson(e)).toList();
    print(post[2].title);
    return post;
  }
}
