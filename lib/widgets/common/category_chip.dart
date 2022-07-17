import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final Color color;
  final String text;
  final double? fontSize;
  const CategoryChip(
      {Key? key, this.color = Colors.pink, required this.text, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: fontSize ?? 8.ssp),
      ),
    );
  }
}
