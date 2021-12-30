part of 'post_bloc.dart';

abstract class PostState {
  const PostState();
}

class PostInitial extends PostState {}

class PostLoaded extends PostState {
  final List<Post>? posts;
  final bool? hasReachMax;
  PostLoaded({this.posts, this.hasReachMax});

  PostLoaded copyWith({List<Post>? posts, bool? hasReachMax}) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachMax: hasReachMax ?? this.hasReachMax,
    );
  }
}
