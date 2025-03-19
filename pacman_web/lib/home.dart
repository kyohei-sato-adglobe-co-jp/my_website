import 'dart:ui';

import 'package:Adglobe/about.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

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
    return Container(
      width: double.infinity,
      height: 3000,
      color: Colors.white,
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
                    button("ABOUT", () {
                      Navigator.of(context).push(_createRoute(const About()));
                    }),
                    button("BUSINESS", () {}),
                    button("PRODUCT", () {}),
                    button("WORKS", () {}),
                    button("COMPANY", () {}),
                    button("RECRUIT", () {}),
                  ],
                ),
              ),
            ])),
        Container(
          color: Colors.black,
          height: 250,
          width: double.infinity,
          child: Center(
            child: Column(
              children: [
                Text("CONTACT", style: GoogleFonts.notoSans(fontWeight: FontWeight.bold, fontSize: 60, color: Colors.white)),
                Text("お問い合わせ", style: GoogleFonts.notoSans(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textField("名前", TextEditingController()),
            textField("御社名", TextEditingController()),
            textField("部署名", TextEditingController()),
          ],
        )
      ]),
    );
  }

  Row textField(String label, TextEditingController controller) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(label),
      const SizedBox(
        width: 20,
      ),
      SizedBox(
        width: 500,
        height: 50,
        child: TextField(
          controller: controller,
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }

  Route _createRoute(page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
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
