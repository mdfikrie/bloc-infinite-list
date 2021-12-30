import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinite_list/data/models/post.dart';
import 'package:infinite_list/data/provider/post_provider.dart';
import 'package:infinite_list/data/repositories/post_repository.dart';

Future<void> main() async {
  final postProvider = PostRepository();
  await postProvider.getPost(1, 5);
  // Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts?_start=' +
  //     1.toString() +
  //     '&_limit=' +
  //     5.toString());
  // final response = await http.get(url);
  // final result = json.decode(response.body) as List;
  // final post = result.map((e) => Post.fromJson(e)).toList();
  // print(post);
}
