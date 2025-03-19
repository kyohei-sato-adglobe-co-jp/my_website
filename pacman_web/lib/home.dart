import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            constraints: const BoxConstraints(minHeight: 100),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0, // 影の広がり
                  blurRadius: 10, // ぼかし範囲
                  offset: const Offset(0, 1), // 下方向に影を移動
                ),
              ],
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                height: 40,
                width: 200,
                child: Image.asset('assets/logo.png'),
              ),
              const Spacer(),
              Expanded(
                child: Wrap(
                  children: [
                    button("ABOUT", () {}),
                    button("BUSINESS", () {}),
                    button("PRODUCT", () {}),
                    button("WORKS", () {}),
                    button("COMPANY", () {}),
                    button("RECRUIT", () {}),
                  ],
                ),
              ),
            ]))
      ]),
    );
  }

  button(name, onPress) {
    return TextButton(
        onPressed: onPress,
        child: Text(
          name,
          style: GoogleFonts.notoSans(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ));
  }
}
