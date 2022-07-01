
import 'package:flutter/material.dart';

import '../Classes/Community.dart';
import '../Classes/User.dart';
import 'AddCommunity.dart';
import 'ListOfCommunities.dart';


class CommunityScreen extends StatefulWidget {
  User user;

  CommunityScreen({required Key key, required this.user}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState(user: user);
}

class _CommunityScreenState extends State<CommunityScreen> {
  User user;
  User temp_user = new User(username: "amirmohseni87", password: "123456");

  _CommunityScreenState({required this.user}) {
    user = temp_user;
    user.addCommunity(new Community(name: 'r/Valorant', description: 'Cringe', admins: [user], image: 'https://tr.rbxcdn.com/4f24f514964225c249b4dc004ebcbe64/420/420/Image/Png'));
    user.addCommunity(new Community(name: 'r/EA Sport', description: 'Cringe', admins: [user], image: 'https://media.contentapi.ea.com/content/dam/eacom/en-us/common/october-ea-ring.png'));
    user.addCommunity(new Community(name: 'r/Star wars', description: 'Cringe', admins: [user], image: 'https://images.bonanzastatic.com/afu/images/0282/4b02/773d_5392595648/s-l1600.jpg'));
    user.addCommunity(new Community(name: 'r/Champions league', description: 'Cringe', admins: [user], image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_FpknB8aQlF_bR6SZZcCWDXUCGGaWK2bzzQ&usqp=CAU'));
    user.addCommunity(new Community(name: 'r/Real Madrid', description: 'Cringe', admins: [user], image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStMY_bWW9MbAFxNtG6RbQBLpnUZkyxviFmOA&usqp=CAU'));
  }
/*
  List<Community> communities =
  [Community(name: 'r/Valorant', description: 'Cringe', admins: [], image: 'https://tr.rbxcdn.com/4f24f514964225c249b4dc004ebcbe64/420/420/Image/Png', ),
    Community(name: 'r/EA Sport', description: 'Cringe', admins: [], image: 'https://media.contentapi.ea.com/content/dam/eacom/en-us/common/october-ea-ring.png'),
    Community(name: 'r/Star wars', description: 'Cringe', admins: [], image: 'https://images.bonanzastatic.com/afu/images/0282/4b02/773d_5392595648/s-l1600.jpg'),
    Community(name: 'r/Champions league', description: 'Cringe', admins: [], image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_FpknB8aQlF_bR6SZZcCWDXUCGGaWK2bzzQ&usqp=CAU'),
    Community(name: 'r/Real Madrid', description: 'Cringe', admins: [], image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStMY_bWW9MbAFxNtG6RbQBLpnUZkyxviFmOA&usqp=CAU')
  ];

 */
  void addCommunity(Community community) {
    setState(() {
      user.communities.add(community);
    });
  }
  void removeCommunity(int index) {
    setState(() {
      user.communities.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView.builder(
            itemCount: user.communities.length,
            itemBuilder: (context, index) {
              return ShowCommunityList(user.communities[index], () => removeCommunity(index), key: Key("key"),);
            },),),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return AddCommunity(
                addCommunity: addCommunity,
                key: Key("value"),
                user: user,
              );
            }));
          },
          hoverColor: Colors.teal,
        ),
      ),);
  }
}
