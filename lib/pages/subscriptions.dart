import 'package:flutter/material.dart';

class Subscriptions extends StatefulWidget {
  Subscriptions({Key? key}) : super(key: key);

  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text(
           'Inscrições',
           style: TextStyle(
             fontSize: 25
           ),
         ),
       ),
    );
  }
}