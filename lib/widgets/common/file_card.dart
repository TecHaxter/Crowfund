import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class FileCard extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final double rotate;
  final bool isShifted;
  const FileCard({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    this.rotate = -2 / 360,
    this.isShifted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Positioned(
            left: isShifted ? 8 : 0.0,
            right: 0.0,
            top: isShifted ? 8 : 0.0,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(isShifted ? 0.0 : rotate),
              child: Container(
                height: isShifted ? height - 8 : height,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: isShifted ? 8 : 0.0,
            left: 0.0,
            bottom: isShifted ? 8 : null,
            child: DottedBorder(
              strokeWidth: 4,
              padding: const EdgeInsets.all(0.0),
              dashPattern: const <double>[4, 2],
              child: Container(
                height: isShifted ? height - 10 : height,
                width: double.maxFinite,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
