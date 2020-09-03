import 'package:flutter/material.dart';
import './result.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.blueGrey,
      image: Image.asset('assets/sp.gif'),
      photoSize: 50.0,
      navigateAfterSeconds: MyApp(),
      loaderColor: Colors.blueGrey,
      loadingText: Text("BMI Calculator",style: GoogleFonts.mcLaren(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )),

    );
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

double height = 80;
double weight = 20;
double bmi = 0;
bool male = false;
bool female = false;
String mc = "green";
Color fc = Colors.red;
String p="";
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.blueGrey[900],
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width * 0.42,
                      margin: EdgeInsets.only(left: 20.0, top: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey[700],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey[800],
                              blurRadius: 3,
                              spreadRadius: 3.0,
                              offset: Offset(2.0, 2.0),
                            )
                          ]),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                              height: 80,
                              width: 70,
                              image: AssetImage('assets/images/fm.png'),
                            ),
                          ),
                          Text(
                            "Male",
                            style: GoogleFonts.mcLaren(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15.0,
                                letterSpacing: 1.0),
//                            TextStyle(
//                              fontSize: 20.0,
//                              fontWeight: FontWeight.bold,
//                              color: Colors.white,
//
//                            ),
                          ),
                          Switch(
                            value: male,
                            onChanged: (val) {
                              setState(() {
                                if (female != true) {
                                  male = val;
                                }
                                if (female == true) {
                                  return Fluttertoast.showToast(
                                    msg: "Choose any one Gender",
                                    toastLength: Toast.LENGTH_SHORT,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 20.0,
                                    gravity: ToastGravity.TOP,
                                  );
                                }
                                print(male);
                              });
                            },
                            activeColor: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width * 0.42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey[700],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey[800],
                              blurRadius: 3,
                              spreadRadius: 3.0,
                              offset: Offset(2.0, 2.0),
                            )
                          ]),
                      margin: EdgeInsets.only(right: 20.0, top: 10.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                              height: 80,
                              width: 80,
                              image: AssetImage('assets/images/ff.png'),
                            ),
                          ),
                          Text(
                            "Female",
                            style: GoogleFonts.mcLaren(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15.0,
                                letterSpacing: 1.0),
                          ),
                          Switch(
                            value: female,
                            onChanged: (val) {
                              setState(() {
                                if (male != true) {
                                  female = val;
                                }
                                if (male == true) {
                                  return Fluttertoast.showToast(
                                    msg: "Choose any one Gender",
                                    toastLength: Toast.LENGTH_SHORT,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 20.0,
                                    gravity: ToastGravity.TOP,
                                  );
                                }
                              });
                            },
                            activeColor: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueGrey[700],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey[800],
                        blurRadius: 3,
                        spreadRadius: 3.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ]),
                child: Column(children: [
                  Center(
                    child: Text(
                      "Height (Cm)",
                      style: GoogleFonts.mcLaren(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 1.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Slider(
                    min: 80,
                    max: 240,
                    onChanged: (h) {
                      setState(() {
                        height = h;
                      });
                    },
                    activeColor: Colors.red,
                    divisions: 100,
                    value: height,
                    label: height.round().toString(),
                    inactiveColor: Colors.redAccent,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Row(
                        children:[
                          SizedBox(
                            width: 90.0,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                height-=1;
                              });
                            },
                            child: Icon(
                              Icons.do_not_disturb_on,
                              size: 30.0,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5,right: 5),
                            child: Text(
                              height.round().toString() + " cm",
                              style: GoogleFonts.mcLaren(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 1.0),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                height+=1;
                              });
                            },
                            child: Icon(
                              Icons.add_circle,
                              size: 30.0,
                              color: Colors.white70,
                            ),
                          ),
                        ]
                    ),
                  )
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueGrey[700],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey[800],
                        blurRadius: 3,
                        spreadRadius: 3.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ]),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Weight (Kg)",
                        style: GoogleFonts.mcLaren(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0,
                            letterSpacing: 1.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Slider(
                      min: 10,
                      max: 150,
                      onChanged: (w) {
                        setState(() {
                          weight = w;
                        });
                      },
                      value: weight,
                      divisions: 100,
                      activeColor: Colors.red,
                      label: weight.round().toString(),
                      inactiveColor: Colors.redAccent,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                        children:[
                          SizedBox(
                            width: 90.0,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                weight-=1;
                              });
                            },
                            child: Icon(
                              Icons.do_not_disturb_on,
                              size: 30.0,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5,right: 5),
                            child: Center(
                              child: Text(
                                weight.round().toString() + " Kg",
                                style: GoogleFonts.mcLaren(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    letterSpacing: 1.0),
                              ),

                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                weight+=1;
                              });
                            },
                            child: Icon(
                              Icons.add_circle,
                              size: 30.0,
                              color: Colors.white70,
                            ),
                          ),
                        ]
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey[800],
                        blurRadius: 3,
                        spreadRadius: 3.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ]),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      bmi = (weight) / ((height / 100) * (height / 100));
                      p = bmi.toString().substring(0,5);
                    });
                    if (male != true && female != true) {
                      return Fluttertoast.showToast(
                        msg: "Choose Gender",
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20.0,
                        gravity: ToastGravity.TOP,
                      );
                    } else if (male == true && female == false) {
                      if (bmi < 18.5) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => result(
                                    bmi,
                                    "Under Weigth",
                                    'assets/images/mlean.png',
                                    Colors.green,'A BMI of $p indicates that you are underweight, so you may need to put on some weight. You are recommended to ask your doctor or a dietitian for advice.')));
                      } else if (bmi >= 18.5 && bmi <= 25) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => result(
                                    bmi,
                                    "Healthy Range",
                                    'assets/images/mnormal.png',
                                    Colors.green,'A BMI of $p indicates that you are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.')));
                      } else if (bmi > 25 && bmi <= 30) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => result(bmi, "Over Weigth",
                                    'assets/images/mmid.png', Colors.green,'A BMI of $p indicates that you are slightly overweight. You may be advised to lose some weight for health reasons. You are recommended to talk to your doctor or a dietitian for advice.')));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => result(bmi, "Obese",
                                    'assets/images/mfat.png', Colors.green,'A BMI of $p indicates that you are heavily overweight. Your health may be at risk if you do not lose weight. You are recommended to talk to your doctor or a dietitian for advice.')));
                      }
                    } else if (female == true && male == false) {
                      if (bmi < 18.5) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => result(
                                    bmi,
                                    "Under Weight",
                                    'assets/images/wlean.png',
                                    Colors.red,'A BMI of $p indicates that you are underweight, so you may need to put on some weight. You are recommended to ask your doctor or a dietitian for advice.')));
                      } else if (bmi >= 18.5 && bmi <= 25) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => result(
                                    bmi,
                                    "Healthy Range",
                                    'assets/images/normal.png',
                                    Colors.red,'A BMI of $p indicates that you are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.')));

                      } else if (bmi > 25 && bmi <= 30) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => result(bmi, "Over Weight",
                                    'assets/images/wmid.png', Colors.red,'A BMI of $p indicates that you are slightly overweight. You may be advised to lose some weight for health reasons. You are recommended to talk to your doctor or a dietitian for advice.')));

                      } else if(bmi >=30 && bmi<=100){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => result(bmi, "Obese",
                                    'assets/images/wover.png', Colors.red,'A BMI of $p indicates that you are heavily overweight. Your health may be at risk if you do not lose weight. You are recommended to talk to your doctor or a dietitian for advice.')));

                      }

                    }
                  },
                  child: Text(
                    "Calculate ♥ BMI",
                    style: GoogleFonts.mcLaren(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 2.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
