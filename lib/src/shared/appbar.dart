import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/resources/assets/assets.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
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
          elevation: 0.0,
          backgroundColor: Colors.black.withOpacity(0.6),
        ),
      ),
    );
  }
}
