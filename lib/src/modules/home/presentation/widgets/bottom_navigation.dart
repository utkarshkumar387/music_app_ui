import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/resources/assets/assets.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xB2171E26).withOpacity(0.8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x330A0B0B),
                blurRadius: 8,
                offset: Offset(0, -4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? const ImageIcon(
                          AssetImage(Assets.homeFillIcon),
                          color: Colors.white,
                        )
                      : const ImageIcon(
                          AssetImage(Assets.homeFillIcon),
                        )),
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? const ImageIcon(
                          AssetImage(Assets.searchIcon),
                          color: Colors.white,
                        )
                      : const ImageIcon(
                          AssetImage(Assets.searchIcon),
                        )),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const ImageIcon(
                        AssetImage(Assets.createButtonIcon),
                        color: Colors.white,
                      )
                    : const ImageIcon(
                        AssetImage(Assets.createButtonIcon),
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const ImageIcon(
                        AssetImage(Assets.usersIcon),
                        color: Colors.white,
                      )
                    : const ImageIcon(
                        AssetImage(Assets.usersIcon),
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 4;
                  });
                },
                icon: pageIndex == 4
                    ? const ImageIcon(
                        AssetImage(Assets.avatarIcon),
                        color: Colors.white,
                      )
                    : const ImageIcon(
                        AssetImage(Assets.avatarIcon),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
