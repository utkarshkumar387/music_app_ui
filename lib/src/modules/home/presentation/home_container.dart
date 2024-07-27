import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/resources/assets/assets.dart';
import '../../../shared/bottom_navigation.dart';
import '../../../shared/svg_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  double _containerHeight = 160.0;
  final double _minHeight = 150.0;
  final double _maxHeight = 160.0;
  bool _isBottomSheetVisible = false;

  void _toggleBottomSheetOpen() {
    setState(() {
      _isBottomSheetVisible = true;
      if (_isBottomSheetVisible == true) {
        _containerHeight = 160.0;
      }
    });
  }

  void _toggleBottomSheetClose() {
    setState(() {
      _isBottomSheetVisible = false;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _containerHeight -= details.delta.dy;
      if (_containerHeight < _minHeight) {
        _containerHeight = _minHeight;
      } else if (_containerHeight > _maxHeight) {
        _containerHeight = _maxHeight;
      }
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_containerHeight < 160) {
      _toggleBottomSheetClose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: const BottomNavbar(),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0), // Adjust the radius as needed
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(Assets.arreLogoIcon),
                      Image.asset(Assets.voiceLogoIcon),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(Assets.notification),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(Assets.chat),
                      ),
                    ],
                  )
                ],
              ),
              // actions: [
              //   Padding(
              //     padding: const EdgeInsets.all(2.0),
              //     child: Image.asset(Assets.notification),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.all(2.0),
              //     child: Image.asset(Assets.chat),
              //   ),
              // ],
              elevation: 0.0,
              backgroundColor: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        preferredSize: const Size(
          double.infinity,
          56.0,
        ),
      ),
      // floatingActionButton: Builder(
      //   builder: (context) => FloatingActionButton(
      //     onPressed: () => {
      //       _toggleBottomSheet(),
      //     },
      //     tooltip: 'Show Bottom Sheet',
      //     child: const Icon(Icons.add),
      //   ),
      // ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: _toggleBottomSheetOpen,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Image.asset(Assets.musicPlay),
                  ),
                );
              },
            ),
          ),
          if (_isBottomSheetVisible)
            Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              child: GestureDetector(
                onVerticalDragUpdate: _onVerticalDragUpdate,
                onVerticalDragEnd: _onVerticalDragEnd,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _containerHeight,
                  decoration: const BoxDecoration(
                    color: Color(0xFF171E26),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                  ),
                  child: Container(
                    height: 30,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          height: 10,
                          width: double.infinity,
                          alignment: Alignment.center,
                          // child: const Icon(Icons.drag_handle),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 221,
                                    height: 40,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'How to make your business grow faster',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Color(0xFFE4F1EE),
                                              fontSize: 14,
                                              fontFamily: 'Ubuntu',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        SizedBox(
                                          width: 202,
                                          child: Text(
                                            '@ShellyShah',
                                            style: TextStyle(
                                              color: Color(0xFF4BC7B6),
                                              fontSize: 12,
                                              fontFamily: 'Hind',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(Assets.heart),
                                      Image.asset(Assets.playButton),
                                      Image.asset(Assets.playlist),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 3,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Opacity(
                                      opacity: 0.60,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 3,
                                        decoration: const BoxDecoration(color: Color(0xFF41595C)),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 124.62,
                                      height: 3,
                                      decoration:
                                          const BoxDecoration(color: const Color(0xFF4BC7B6)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).viewInsets.bottom + kBottomNavigationBarHeight,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          color: Colors.transparent,
          child: Container(
            color: Colors.white,
            child: const Center(
              child: Text('This is a modal bottom sheet'),
            ),
          ),
        );
      },
    );
  }
}
