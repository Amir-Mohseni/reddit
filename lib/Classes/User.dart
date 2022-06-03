
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
  List<Post> Posts = [];
  List<Post>? savedPosts;
  List<Community> communities = [];

  User({  this.username,  this.password, this.email, this.name,  this.id,
    this.profileImage, this.bio, List<Post>? Posts});

  void addPost(Post post){
    if(!Posts.contains(post)) {
      Posts.add(post);
    }
  }

  void deletePost(Post post){
    if(Posts.contains(post)) {
      Posts.remove(post);
    }
  }

  void addCommunity(Community community){
    if(!communities.contains(community)) {
      communities.add(community);
    }
  }

  void createCommunity(String name, String description, Object? image){
    List <User> admins = [this];
    Community community = Community(name, description, admins, image);
    addCommunity(community);
  }

  void removePost(Post post) {
    if(Posts.contains(post)) {
      Posts.remove(post);

    }
  }
}