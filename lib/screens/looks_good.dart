import 'package:flutter/material.dart';

class LooksGood extends StatelessWidget {
  static const routeName = '/looks-good';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              child: Image.asset("images/health_check.jpeg"),
            ),
            Text(
              "Everything looks Good !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "Looks like the baby is quite healthy at this point !",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
