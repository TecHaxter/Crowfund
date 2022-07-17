import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class SlidDrawnButton extends StatelessWidget {
  final Color color;
  final String imageUrl;
  final String title;
  const SlidDrawnButton({
    Key? key,
    required this.color,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 85.w,
        width: 80.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 6.w,
              top: 0.0,
              child: Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
            ),
            Positioned(
              right: 6.w,
              top: 6.w,
              child: Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
