import 'package:reddit/Classes/Community.dart';

import 'Post.dart';

class User {
  String? password;
  String? username;
  String? email;
  String? name;
  String? id;
  Object? profileImage;
  String? bio;
  List<Post>? Posts;
  List<Post>? savedPosts;
  List<Community>? communities;

  User({  this.username,  this.password, this.email, this.name,  this.id,
      this.profileImage, this.bio});
}
