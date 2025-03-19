import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 3000,
      child: Column(children: [
        Container(
            width: double.infinity,
            height: 70,
            color: Colors.white,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                height: 40,
                width: 200,
                child: Image.asset('assets/logo.png'),
              ),
              Wrap(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Flexible(
                      child: Text(
                        "ABOUTあいうえ",
                        style: GoogleFonts.notoSans(fontSize: 24, color: Colors.black),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Flexible(
                      child: Text(
                        "BUSINESS",
                        style: GoogleFonts.notoSans(fontSize: 24, color: Colors.black),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Flexible(
                      child: Text(
                        "PRODUCT",
                        style: GoogleFonts.notoSans(fontSize: 24, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ]))
      ]),
    );
  }
}
