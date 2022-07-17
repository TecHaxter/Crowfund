import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  final Widget main;
  final String? notiText;
  final Color? bgColor;
  final Color? textColor;
  const NotificationIcon({
    Key? key,
    required this.main,
    this.notiText,
    this.bgColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        main,
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 12.r,
            height: 12.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.r),
              color: bgColor,
              border: Border.all(
                color: textColor ?? Colors.transparent,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              notiText ?? '',
              style: TextStyle(
                fontSize: 8.ssp,
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
