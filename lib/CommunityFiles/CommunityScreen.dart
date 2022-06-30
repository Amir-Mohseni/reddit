
import 'package:flutter/material.dart';

import '../Classes/Community.dart';
import 'AddCommunity.dart';
import 'ListOfCommunities.dart';


class CommunityScreen extends StatefulWidget {


  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<Community> communities = [Community('r/Valorant', 'https://tr.rbxcdn.com/4f24f514964225c249b4dc004ebcbe64/420/420/Image/Png'),
    Community('r/EA Sport', 'https://media.contentapi.ea.com/content/dam/eacom/en-us/common/october-ea-ring.png'),
    Community('r/Star wars', 'https://images.bonanzastatic.com/afu/images/0282/4b02/773d_5392595648/s-l1600.jpg'),
    Community('r/Champions league', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_FpknB8aQlF_bR6SZZcCWDXUCGGaWK2bzzQ&usqp=CAU'),
    Community('r/Real Madrid', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStMY_bWW9MbAFxNtG6RbQBLpnUZkyxviFmOA&usqp=CAU')
  ];
  void addCommunity(Community community) {
    setState(() {
      communities.add(community);
    });
  }
  void removeCommunity(int index) {
    setState(() {
      communities.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 53, 71, 74),
        
        body: Center(
          child: ListView.builder(
            itemCount: communities.length,
            itemBuilder: (context, index) {
              return ShowCommunityList(communities[index], () => removeCommunity(index));
            },),),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return AddCommunity(
                addCommunity: addCommunity,
              );
            }));
          },
          hoverColor: Colors.teal,
        ),
      ),);
  }
}
