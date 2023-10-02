import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Padding(
              padding: const EdgeInsets.only(left: 44, right: 44),
              child: Container(
                  width: 400,
                  height: 300,
                  // margin: EdgeInsets.all(30),
                  child:const Image(
                    image: AssetImage('lib/assets/undraw_Weather_re_qsmd.png'),
                  )),
            ),
          const  Text('Start Search about weather!',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
