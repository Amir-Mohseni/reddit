import 'Like.dart';

class Post{
  dynamic content;
  DateTime createdAt;
  Object id;
  Object image;
  int likeCount;
  Like like;

  Post(this.content, this.createdAt, this.id, this.image, this.likeCount,this.like);
}