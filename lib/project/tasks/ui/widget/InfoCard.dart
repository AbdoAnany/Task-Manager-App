
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/theming/colors.dart';

class InfoCard extends StatelessWidget {
  final String?  title;
  final String? value;
  final Color? topColor;
  final bool isActive ;
  final Function? onTap;
  final Color? bezierCOlor;
  const  InfoCard({ Key? key, this.title, this.value, this.topColor, this.isActive = false, this.onTap, this.bezierCOlor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,//width: 200.w,

      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            color: ColorsManager.primaryColor.withOpacity(.1),
            blurRadius: 12
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Stack(
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Row(
                  children: [
                   Expanded(child: Container(
                     color: topColor ??  ColorsManager.primaryColor,
                     height: 5,
                   ) ,)
                ],),


                Expanded(
                  child: Center(
                    child: RichText(
                      textDirection: TextDirection.rtl,
                      strutStyle: StrutStyle(
                        fontSize: 18,
                        height: 1.5
                      ),
                       maxLines: 2,
                       textHeightBehavior: TextHeightBehavior(
                         applyHeightToFirstAscent: true,
                         applyHeightToLastDescent: true

                       ),
                       textScaleFactor: 1.2,
                       textWidthBasis: TextWidthBasis.longestLine,
                       locale: Locale('ar'),
                      textAlign: TextAlign.center,


                      text: TextSpan(

                    children: [
                      TextSpan(

                        text: "$title\n",
                        style: TextStyle(
                          fontSize: 12.w,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        )
                      ),



                       TextSpan(
                        text: "$value\n",
                        style:  TextStyle(
                          fontSize: 18.w,
                          color: isActive ? ColorsManager.primaryColor : ColorsManager.black
                        )
                      )
                    ]
                    )),
                  ),
                ),

              ],
            ),
              Positioned(


                child: Opacity( //semi red clippath with more height and with 0.5 opacity
                  opacity: 0.1,
                  child: ClipPath(
                      clipper:WaveClipper(), //set our custom wave clipper
                        child:Container(
                            color: bezierCOlor,
                            height:80,
                        ),
                     ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    
      var path = new Path();
      path.lineTo(0, size.height); //start path with this if you are making at bottom
      
      var firstStart = Offset(size.width / 5, size.height); 
      //fist point of quadratic bezier curve
      var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
      //second point of quadratic bezier curve
      path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

      var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105); 
      //third point of quadratic bezier curve
      var secondEnd = Offset(size.width, size.height - 10);
      //fourth point of quadratic bezier curve
      path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

      path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
      path.close();
      return path; 
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
     return false; //if new instance have different instance than old instance 
     //then you must return true;
  }
}