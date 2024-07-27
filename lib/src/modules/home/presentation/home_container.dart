import 'package:flutter/material.dart';
import 'package:mobile_music_ui/src/modules/home/presentation/widgets/music_player_drawer.dart';

import '../../../core/resources/assets/assets.dart';
import '../../../shared/appbar.dart';
import '../../../shared/bottom_navigation.dart';

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
      appBar: const PreferredSize(
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
        child: Appbar(),
      ),
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
            MusicPlayerDrawer(
                onVerticalDragUpdate: _onVerticalDragUpdate,
                onVerticalDragEnd: _onVerticalDragEnd,
                containerHeight: _containerHeight)
        ],
      ),
    );
  }
}
