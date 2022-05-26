import 'Like.dart';
import 'User.dart';

class Post{
  User user;
  dynamic content;
  DateTime createdAt;
  Object id;
  Object image;
  int likeCount;
  Like like;

  Post(this.user, this.content, this.createdAt, this.id, this.image, this.likeCount,this.like);
}