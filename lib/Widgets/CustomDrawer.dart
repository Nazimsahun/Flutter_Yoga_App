import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit:  BoxFit.cover,
                image: NetworkImage("https://images.unsplash.com/photo-1545389336-cf090694435e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80")
              )
            ),
          ),
          ListTile(
            title: Text("Reset Progress" , style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.restart_alt_sharp , size: 25,),
          ),
          ListTile(
            title: Text("Share With Friends" , style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.share , size: 25,),
          ),
          ListTile(
            title: Text("Rate Us" , style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.star , size: 25,),
          ),
          ListTile(
            title: Text("Feedback" , style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.comment , size: 25,),
          ),
          ListTile(
            title: Text("Privacy Policy" , style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.security , size: 25,),
          ),
          Divider(thickness: 2, endIndent: 30, indent: 30,),
          Text("Version 1.0.0" , style: TextStyle(fontWeight: FontWeight.bold),)

        ],
      ),
    );
  }
}
