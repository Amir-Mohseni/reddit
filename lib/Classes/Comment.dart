import 'Like.dart';
import 'Post.dart';
import 'User.dart';

class comment {
  String? content;
  User? commenter;
  DateTime? createdAt;
  List<comment>? replies;
  List<Like>? likes;
  Post post;
  comment({required this.content, required this.commenter, this.createdAt, this.replies, this.likes, required this.post});
  void addReply(comment reply){
    replies?.add(reply);
  }
  void addLike(Like like){
    likes?.add(like);
  }
  void removeLike(Like like){
    if(likes == null){
      likes = [];
    }
    likes?.remove(like);
  }
  bool containsLike(Like like){
    if(likes == null){
      likes = [];
    }
    return likes?.contains(like)??false;
  }
  void changeContent(String content){
    this.content = content;
  }
  void removeReply(comment reply){
    if(replies == null){
      replies = [];
    }
    replies?.remove(reply);
  }

}