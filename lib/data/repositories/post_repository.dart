import 'package:infinite_list/data/models/post.dart';
import 'package:infinite_list/data/provider/post_provider.dart';

class PostRepository {
  final postProvider = PostProvider();
  Future<List<Post>> getPost(int start, int limit) {
    return postProvider.getPost(start, limit);
  }
}
