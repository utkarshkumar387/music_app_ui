import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgWidget extends StatelessWidget {
  const SvgWidget({
    super.key,
    required this.localPath,
    this.onClick,
    this.height,
    this.width,
  });

  final String localPath;
  final VoidCallback? onClick;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: SvgPicture.asset(
        localPath,
        height: height,
        width: width,
      ),
    );
  }
}
