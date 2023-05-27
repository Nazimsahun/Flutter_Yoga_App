import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/WorkOutDet.dart';
import 'package:provider/provider.dart';

class rUready extends StatelessWidget {
  const rUready({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
        create: (context)=>TimerModel(context),
    child: Scaffold(
      body: Center(
        child: Container(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
SizedBox(height: MediaQuery.of(context).size.height/2-100,),
              Text("ARE YOU READY?", style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold), ),
              SizedBox(height: 40,),
              Consumer<TimerModel>(builder: (context , myModel , child){
                return Text(myModel.countdown.toString() , style: TextStyle(fontSize: 48 ),);}),
Spacer(),
              Divider( thickness: 2,),
              Align(
                alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
                    child: Text("Next: Anulom Vilom" , style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold),),
                  ))

            ],
          ),
        ),
      ),
    ),
    );
  }
}


class TimerModel with ChangeNotifier{
  TimerModel(context){
    MyTimer(context);
  }
  int countdown = 5;

  MyTimer(context) async{
     Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      if(countdown == 0){
        timer.cancel();
        timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkOutDet()));
      }
      notifyListeners();

    });
  }
}