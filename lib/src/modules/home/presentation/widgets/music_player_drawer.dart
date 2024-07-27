import 'package:flutter/material.dart';

import '../../../../core/resources/assets/assets.dart';

class MusicPlayerDrawer extends StatelessWidget {
  final Function(DragUpdateDetails details) onVerticalDragUpdate;
  final Function(DragEndDetails details) onVerticalDragEnd;
  final double containerHeight;

  const MusicPlayerDrawer({
    Key? key,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
    required this.containerHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).viewInsets.bottom,
      child: GestureDetector(
        onVerticalDragUpdate: onVerticalDragUpdate,
        onVerticalDragEnd: onVerticalDragEnd,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: containerHeight,
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
                              decoration: const BoxDecoration(color: const Color(0xFF4BC7B6)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom + kBottomNavigationBarHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
