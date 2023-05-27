import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/Startup.dart';
import 'package:flutter_yoga/Widgets/CustomAppBar.dart';
import 'package:flutter_yoga/Widgets/CustomDrawer.dart';
import 'package:flutter_yoga/model/model.dart';
import 'package:flutter_yoga/services/yogadb.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween, _homeTween, _yogaTween, _iconTween, _drawerTween;
  late AnimationController _textAnimationController;




  Future makeYogaEntry(Yoga yoga , String TableName) async {
    await YogaDatabase.instance.Insert(yoga, TableName);

  }

  Future makeYogaSumEntry(YogaSummary yogaSummary) async {
    await YogaDatabase.instance.InsertYogaSum(yogaSummary);

  }
bool isLoading = true;
late List<YogaSummary> yogasumlst;
  Future readYogaSumEntry( ) async{
    this.yogasumlst = await YogaDatabase.instance.readAllYogaSum();
    isLoading = false;

      // print(yogasumlst[0].YogaWorkOutName.toString());
    setState(() {
      print(yogasumlst.toString());
    });

  }

  @override
  void initState() {
      _animationController =
          AnimationController(vsync: this, duration: Duration(seconds: 0));
      _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
          .animate(_animationController);
      _iconTween = ColorTween(begin: Colors.white, end: Colors.lightBlue)
          .animate(_animationController);
      _drawerTween = ColorTween(begin: Colors.white, end: Colors.black)
          .animate(_animationController);
      _homeTween = ColorTween(begin: Colors.white, end: Colors.blue)
          .animate(_animationController);
      _yogaTween = ColorTween(begin: Colors.white, end: Colors.black)
          .animate(_animationController);
      _textAnimationController =
          AnimationController(vsync: this, duration: Duration(seconds: 0));
      super.initState();

    // CREATING ONE YOGA WORKOUT PACK
    makeYogaSumEntry(YogaSummary(YogaWorkOutName: YogaModel.YogaTable1, BackImg: "BAhttps://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1220&q=80CKIMAGURL", TimeTaken: "36", TotalNoOfWork: "12"));
    makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "https://images.squarespace-cdn.com/content/v1/5e13030d166215441db6be9c/1579169359456-Z0OGVGKO6LXEG4HZDJ3D/Yoga-Flow-Animation.gif?format=2500w", YogaTitle: "Anulom Vilom", SecondsOrTimes: '30'), YogaModel.YogaTable1);
    makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "https://images.squarespace-cdn.com/content/v1/5e13030d166215441db6be9c/1579169359456-Z0OGVGKO6LXEG4HZDJ3D/Yoga-Flow-Animation.gif?format=2500w", YogaTitle: "Kapalbhati", SecondsOrTimes: '15'), YogaModel.YogaTable1);
    makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "https://images.squarespace-cdn.com/content/v1/5e13030d166215441db6be9c/1579169359456-Z0OGVGKO6LXEG4HZDJ3D/Yoga-Flow-Animation.gif?format=2500w", YogaTitle: "Pranam", SecondsOrTimes: '12'), YogaModel.YogaTable1);
    makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "https://images.squarespace-cdn.com/content/v1/5e13030d166215441db6be9c/1579169359456-Z0OGVGKO6LXEG4HZDJ3D/Yoga-Flow-Animation.gif?format=2500w", YogaTitle: "Shwasari", SecondsOrTimes: '16'), YogaModel.YogaTable1);

readYogaSumEntry();



  }

  bool scrollListner(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: scrollListner,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(50, 150, 50, 40),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(13),
                                      bottomLeft: Radius.circular(13))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                      Text("Streak",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "120",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                      Text("kCal",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "26",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                      Text("Minutes",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(bottom: 15),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "Yoga For All",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Startup()));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80"))),
                                          ),
                                          Container(
                                            height: 150,
                                            color: Colors.black26,
                                          ),
                                          Positioned(
                                            right: 20,
                                            left: 10,
                                            top: 10,
                                            child: Text(
                                              "Yoga For Begineers",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Positioned(
                                            right: 30,
                                            left: 12,
                                            top: 38,
                                            child: Text(
                                              "Last Time : 2 Feb",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://images.unsplash.com/photo-1510894347713-fc3ed6fdf539?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"))),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Weight Loss Yoga",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Positioned(
                                          right: 30,
                                          left: 12,
                                          top: 38,
                                          child: Text(
                                            "Last Time : 22 Jan",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://images.unsplash.com/photo-1573590330099-d6c7355ec595?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"))),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Suryanamaskar",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Positioned(
                                          right: 30,
                                          left: 12,
                                          top: 38,
                                          child: Text(
                                            "Last Time : Yesterday",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 15),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "Choose Your Type",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://images.unsplash.com/photo-1599901860904-17e6ed7083a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"))),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Power Yoga",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Positioned(
                                          right: 30,
                                          left: 12,
                                          top: 38,
                                          child: Text(
                                            "Last Time : Yesterday",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://media.istockphoto.com/photos/young-woman-in-yoga-pose-using-laptop-at-home-picture-id1334071264?b=1&k=20&m=1334071264&s=170667a&w=0&h=0wnQzJJJIA5NMo6dOmVepS6mXC0eqLjI26ADDlIK4Lg="))),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Breathing Yoga",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Positioned(
                                          right: 30,
                                          left: 12,
                                          top: 38,
                                          child: Text(
                                            "Last Time : 29 Jan",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://images.unsplash.com/photo-1556816723-1ce827b9cfbb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=792&q=80"))),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Increase Flexibility",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Positioned(
                                          right: 30,
                                          left: 12,
                                          top: 38,
                                          child: Text(
                                            "Last Time : 29 Jan",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomAppBar(
                      animationController: _animationController,
                      colorsTween: _colorTween,
                      drawerTween: _drawerTween,
                      homeTween: _homeTween,
                      iconTween: _iconTween,
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      yogaTween: _yogaTween)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
