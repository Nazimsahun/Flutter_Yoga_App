import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/rUready.dart';

class Startup extends StatefulWidget {
  const Startup({Key? key}) : super(key: key);

  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>rUready()));
      }, child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30 ,vertical: 10),
          child: Text("START" ,style: TextStyle(fontSize: 20),)),),
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            expandedHeight: 300,
            pinned: true,



            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text("Yoga"),
              background: Image.network("https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80" , fit: BoxFit.cover,),
            ),

            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt_rounded))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("16 Mins || 26 Workouts" , style: TextStyle(fontWeight: FontWeight.w400),)
                    ],
                  ),
                  Divider(thickness: 2,),
                  ListView.separated(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index)=>Divider(thickness: 2,),itemBuilder: (context, index)=>
                      ListTile(leading: Container(margin: EdgeInsets.only(right: 20),
                          child: Image.network("https://i.pinimg.com/originals/02/28/74/0228749d03812fc95700955e1a05d42e.gif" ,fit: BoxFit.cover,)),title: Text("Yoga $index" , style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 18),), subtitle: Text((index%2 == 0) ?"00:20" : "x20" , style: TextStyle(fontSize: 15),),) , itemCount: 10)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}