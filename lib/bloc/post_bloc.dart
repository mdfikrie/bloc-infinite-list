import 'package:bloc/bloc.dart';

import 'package:infinite_list/data/models/post.dart';
import 'package:infinite_list/data/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    final repository = PostRepository();
    List<Post> posts;
    on<GetAllPost>(
      (event, emit) async {
        if (state is PostInitial) {
          posts = await repository.getPost(0, 10);
          emit(PostLoaded(posts: posts, hasReachMax: false));
        } else {
          PostLoaded postLoaded = state as PostLoaded;
          posts = await repository.getPost(postLoaded.posts!.length, 10);
          emit(
            posts.isEmpty
                ? PostLoaded().copyWith(hasReachMax: true)
                : PostLoaded(
                    posts: postLoaded.posts! + posts,
                    hasReachMax: false,
                  ),
          );
        }
      },
    );
  }
}
