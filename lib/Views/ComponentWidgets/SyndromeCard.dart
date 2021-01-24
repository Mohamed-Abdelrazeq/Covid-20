import 'package:covidnews_app/Views/Screens/SyndromeScreen.dart';
import 'package:flutter/material.dart';

class SyndromeCard extends StatelessWidget {
  const SyndromeCard({
    Key key,
    @required this.width,
    @required this.height,
    @required this.imagePath,
    @required this.mySyndromeName,
    @required this.mySyndromeData,
  }) : super(key: key);

  final double width;
  final double height;
  final String imagePath;
  final String mySyndromeName;
  final String mySyndromeData;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SyndromeScreen(syndromeName: mySyndromeName,imagePath: imagePath,mySyndromeData: mySyndromeData,),),
        );
      },
      child: Container(
        width: width*.4,
        height: height*.23,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height*.03),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                    )
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              mySyndromeName,
              style: TextStyle(
                  fontSize:24,
                  fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
