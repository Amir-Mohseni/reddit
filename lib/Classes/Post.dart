import 'Like.dart';
import 'User.dart';

class Post{
  dynamic content;
  DateTime createdAt=DateTime.now();
  Object? id;
  Object? image;
  int? likeCount;
  Like? like;
  User author;

  Post({ required this.content, this.id, this.image, this.likeCount,this.like, required this.author});
}