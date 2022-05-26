import 'Like.dart';

class Post{
  dynamic content;
  DateTime createdAt=DateTime.now();
  Object? id;
  Object? image;
  int? likeCount;
  Like? like;

  Post({ required this.content, this.id, this.image, this.likeCount,this.like});
}