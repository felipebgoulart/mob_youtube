import 'package:flutter/material.dart';

class WhatShot extends StatefulWidget {
  WhatShot({Key? key}) : super(key: key);

  @override
  _WhatShotState createState() => _WhatShotState();
}

class _WhatShotState extends State<WhatShot> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text(
           'Em alta',
           style: TextStyle(
             fontSize: 25
           ),
         ),
       ),
    );
  }
}