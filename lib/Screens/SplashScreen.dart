import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //CHECK INSTALLATION,INSERT,READ,UPDATE,OPERATION STATUS

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        }, child: Text("HOME PAGE"),),
      ),
    );
  }
}
