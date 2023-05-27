import 'package:flutter/material.dart';
class Finish extends StatelessWidget {
  const Finish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network("https://media.istockphoto.com/vectors/first-prize-gold-trophy-iconprize-gold-trophy-winner-first-prize-vector-id1183252990?k=20&m=1183252990&s=612x612&w=0&h=BNbDi4XxEy8rYBRhxDl3c_bFyALnUUcsKDEB5EfW2TY=" , width: 350, height: 350,)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 13 , horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("125" , style: TextStyle(fontSize: 26 , fontWeight: FontWeight.bold),),
                    Text("KCal" , style :TextStyle(fontSize: 14 , fontWeight: FontWeight.bold),)
                  ],
                ),
                Column(
                  children: [
                    Text("12" , style: TextStyle(fontSize: 26 , fontWeight: FontWeight.bold),),
                    Text("Minutes" , style :TextStyle(fontSize: 14 , fontWeight: FontWeight.bold),)
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("DO IT AGAIN" ,style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 15 ),),
                Text("SHARE" ,style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 15 ),),
              ],
            ),
          ),
          Divider(thickness: 2,),
          Container(
            child: Column(
              children: [

              ElevatedButton(onPressed: (){}, child: Container(
                width: MediaQuery.of(context).size.width - 70,
                padding: const EdgeInsets.all(18.0),
                child: Text("RATE OUR APP" , style: TextStyle(fontSize: 20) , textAlign: TextAlign.center,),
              ))
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.grey,
          )

        ],
      ),
    );
  }
}
