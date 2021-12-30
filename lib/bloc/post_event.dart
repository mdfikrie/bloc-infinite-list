part of 'post_bloc.dart';

abstract class PostEvent {
  const PostEvent();
}

class GetAllPost extends PostEvent {}
