import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_music_ui/src/modules/home/presentation/widgets/bottom_navigation.dart';

import '../../../core/resources/assets/assets.dart';
import '../../../shared/svg_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        bottomNavigationBar: const BottomNavigation(),
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AppBar(
                title: Text('Arre Voice'),
                elevation: 0.0,
                backgroundColor: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          preferredSize: Size(
            double.infinity,
            56.0,
          ),
        ),
        body: Container(
          color: Colors.black,
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Image.asset(Assets.musicPlay),
              );
            },
          ),
        ));
  }
}
