

import 'package:reddit/Classes/Community.dart';

import 'Like.dart';
import 'User.dart';

class Post{
  late String title;
  late String content;
  DateTime createdAt=DateTime.now();
  Community? community;
  Object? id;
  Object? image;
  int? likeCount;
  Like? like;
  List<String>? comments;
  User? user;

  Post({required this.title, required this.content, this.community, this.id, this.image, this.likeCount,this.like,this.comments,this.user});
}