import 'Post.dart';
import 'User.dart';

class Comment {
  String text;
  User author;
  Post post;
  DateTime createdAt = DateTime.now();
  List<User> likes = [];
  List<Comment> replies = [];

  Comment(this.text, this.author, this.post);

  void addLike(User user) {
    if (!likes.contains(user)) {
      likes.add(user);
    }
  }

  void removeLike(User user) {
    if (likes.contains(user)) {
      likes.remove(user);
    }
  }

  bool isLikedBy(User user) {
    return likes.contains(user);
  }

  void addReply(Comment comment) {
    replies.add(comment);
  }

  void removeReply(Comment comment) {
    replies.remove(comment);
  }

}