import 'package:My_News/home_layout/home_layout.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1000,
      child: EasySplashScreen(
        logo: Image.network(
            'https://thumbs.dreamstime.com/z/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg',
          width:double.infinity,height: 600,),

        title: Text(
          "Title",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        showLoader: true,
        loadingText: Text("Loading..."),
        durationInSeconds: 5,
        navigator:home_layout() ,
      ),
    );
  }
}