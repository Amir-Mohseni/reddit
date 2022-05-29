

import 'Like.dart';
import 'User.dart';

class Post{
  dynamic content;
  DateTime createdAt=DateTime.now();
  Object? id;
  Object? image;
  int? likeCount;
  Like? like;
  List<String>? comments;
  User? user;

  Post({ required this.content, this.id, this.image, this.likeCount,this.like,this.comments,this.user});
}