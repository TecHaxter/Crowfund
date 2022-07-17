import 'package:flutter/material.dart';

class Stitch extends StatelessWidget {
  final double length;
  final double rotate;
  const Stitch({Key? key, required this.length, required this.rotate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(rotate),
      child: SizedBox(
        height: 16,
        width: length,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0.0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.white, width: 3.0),
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.white, width: 3.0),
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              right: 8,
              left: 8,
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
