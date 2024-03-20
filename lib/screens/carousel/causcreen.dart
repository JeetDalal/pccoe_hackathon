import 'package:flutter/material.dart';
import 'package:pccoe_hackathon/screens/auth/doctor_signin_screen.dart';
import 'package:pccoe_hackathon/screens/auth/sign_in_screen.dart';
import 'package:pccoe_hackathon/screens/carousel/data.dart';

class Causcreen extends StatefulWidget {
  @override
  State<Causcreen> createState() => _CauscreenState();
}

class _CauscreenState extends State<Causcreen> {
  late PageController _pageController;
  int _currentpage = 0;
  @override
  void initState() {
    _pageController =
        PageController(initialPage: _currentpage, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Healthcare !"),
      ),
      body: Align(
        alignment: AlignmentDirectional.center,
        child: AspectRatio(
          aspectRatio: 0.85,
          child: PageView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: datalist.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return carouselView(index, context);
              }),
        ),
      ),
    );
  }
}

Widget carouselView(int index, BuildContext context) {
  return carousel(datalist[index], index, context);
}

Widget carousel(Data data, int index, BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 300,
          width: 300,
          child: Image.asset(
            data.url,
            fit: BoxFit.fill,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          data.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      index == 2
          ? InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(SigninScreen.routeName);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Patient login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          : Container(),
      const SizedBox(
        height: 20,
      ),
      index == 2
          ? InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(DoctorSigninScreen.routeName);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Doctor Login"),
                ),
              ),
            )
          : Container()
    ],
  );
}
