import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class result extends StatelessWidget {
  final res;
  String p;
  String i;
  String advice;
  Color color;
  result(this.res,this.p,this.i,this.color,this.advice);
  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI",
          style:GoogleFonts.mcLaren(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.0,letterSpacing: 3.0),
        ),
        backgroundColor: color,
      ),
      body: Container(
        color: getColorFromHex('#ffffff'),

        child: Column(
        children: [

          Center(
            child: Container(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width*0.25,
              child: Image(
                image: AssetImage(i),
              ),
            ),
          ),

          Container(
            width: 350.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20.0)
            ),
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text("BMI : "+"$res".substring(0,5), style:GoogleFonts.mcLaren(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15.0,letterSpacing: 1.0),
                ),
                SizedBox(height: 5,),
                Text(p,style:GoogleFonts.mcLaren(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.0,letterSpacing: 1.0),
                ),
                SizedBox(height: 5,),
                Divider(
                  color: Colors.white,
                  thickness: 3,
                ),
                Text(advice,style: GoogleFonts.mcLaren(fontWeight: FontWeight.w100,color: Colors.white,fontSize: 15.0,letterSpacing: 1.0),),
              ],
            ),
          ),



        ],
        ),
      ),
    );
  }
}
