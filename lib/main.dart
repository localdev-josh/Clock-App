import 'package:clock_app/widgets/responsive_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'screens/first_screen.dart';
import 'screens/second_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  String appTitle = "clock app";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          builder: (BuildContext context, Widget child) {
            var textScaleFactor = 0.86;
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
              child: AppClock(),
            );
          },
          debugShowCheckedModeBanner: false,
          title: appTitle,
        );
      });
    });
  }
}

class AppClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        width: double.infinity,
        color: Colors.red,
        child: DefaultTabController(
            length: 3,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffECF3FF),
                  Color(0xffEAF3FF),
                  Color(0xffF8F9FF),
                  Color(0xffEBF4FF),
                  Color(0xffDAE6EF),
                  Color(0xffB9C2CA)
                ],begin: Alignment.topCenter, end: Alignment.bottomCenter)
              ),
              child: Scaffold(
                  bottomNavigationBar: BottomBar(),
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(55),
                      child: Container(
                        color: Colors.transparent,
                        child: SafeArea(
                          child: Column(
                            children: <Widget>[
                              TabBar(
                                  indicator: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                          color: Color(0xffD582A7), width: 4.0),
                                      insets: EdgeInsets.fromLTRB(
                                          30.0, 20.0, 30.0, 0)),
                                  indicatorWeight: 15,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelColor: Color(0xff2d386b),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      letterSpacing: 1.3,
                                      fontWeight: FontWeight.w500),
                                  unselectedLabelColor: Color(0xffD0DCEF),
                                  tabs: [
                                    Tab(
                                      text: "ALARMS",
                                      icon: Icon(Icons.menu, size: 40),
                                    ),
                                    Tab(
                                      text: "RECORDS",
                                      icon: Icon(Icons.menu, size: 40),
                                    ),
                                    Tab(
                                      text: "PROFILE",
                                      icon: Icon(Icons.supervised_user_circle,
                                          size: 40),
                                    ),
                                  ])
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      Center(
                        child: FirstTab(),
                      ),
                      Center(
                        child: SecondTab(),
                      ),
                      Text("Third Screen")
                    ],
                  )),
            )));
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50, 0, 50, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            child: Text(
              "EDIT ALARMS",
              style: TextStyle(fontFamily: "Poppins", fontSize: 13),
            ),
            color: Color(0xffD44D7B),
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () {},
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffDADEE2).withOpacity(1),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffAFB7C6),
                      offset: Offset(8, 6),
                      blurRadius: 27),
                  BoxShadow(
                      color: Color(0xffCACED3),
                      offset: Offset(-8, -6),
                      blurRadius: 27)
                ]
            ),
            child: FloatingActionButton(
              child: Text(
                "+",
                style: TextStyle(
                    color: Color(0xff253165),
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
              onPressed: () {},
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          )
        ],
      ),
    );
  }
}
