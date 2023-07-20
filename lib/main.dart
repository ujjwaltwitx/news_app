import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/views/screens/search_result_page.dart';
import 'package:news_app/views/widgets/category_carousel.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News app by CometLabs',
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 34, 30, 40)),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Icons.newspaper,
        nextScreen: HomePage(),
        duration: 3000,
        splashIconSize: 100,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<String> topics = ["Sports", "Technology", "Health", "Science"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Icon(
              Icons.newspaper,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "CometNews",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CategoryCarousel(topics[index]);
        },
        itemCount: topics.length,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SearchResultPage(),
            ));
          },
          child: const Icon(Icons.search)),
    );
  }
}
