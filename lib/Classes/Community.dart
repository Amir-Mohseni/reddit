import 'package:reddit/Classes/Post.dart';

import 'User.dart';

class Community{
  List <User> admins;
  List<User> users = [];
  List<Post> posts = [];

  Community(this.admins) {
    admins.forEach((admin) {
      users.add(admin);
    });
  }

  void addUser(User user){
    users.add(user);
  }

  void removeUser(User user){
    users.remove(user);
    for (int i = 0; i < posts.length; i++) {
      if (posts[i].user == user) {
        posts.removeAt(i);
      }
    }
  }

  bool containsUser(User user){
    for(User u in users){
      if(u.username == user.username)
        return true;
    }
    return false;
  }

  void addPost(Post post){
    posts.add(post);
  }

  int getUserCount(){
    return users.length;
  }

  int getPostCount(){
    return posts.length;
  }

  void removePost(Post post){
    posts.remove(post);
    for (int i = 0; i < users.length; i++) {
      if (users[i].username == post.user.username) {
        users[i].removePost(post);
      }
    }
  }
}