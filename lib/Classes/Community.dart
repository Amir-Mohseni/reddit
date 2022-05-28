import 'package:reddit/Classes/Post.dart';

import 'User.dart';

class Community{
  String name;
  String description;
  List <User> admins;
  Object? image;
  List<User> users = [];
  List<Post> posts = [];

  Community(this.name, this.description, this.admins, this.image) {
    admins.forEach((admin) {
      users.add(admin);
    });
  }

  void addUser(User user){
    if(!users.contains(user)){
      users.add(user);
    }
  }

  void addAdmin(User user){
    if(!admins.contains(user)){
      admins.add(user);
      users.add(user);
    }
  }

  void removeUser(User user){
    if(users.contains(user)){
      users.remove(user);
      admins.remove(user);
    }
    for (int i = 0; i < posts.length; i++) {
      if (posts[i].author == user) {
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

  bool isAdmin(User user){
    for(User u in admins){
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
      if (users[i].username == post.author.username) {
        users[i].removePost(post);
      }
    }
  }
}