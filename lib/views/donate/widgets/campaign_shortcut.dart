import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:crowfund/widgets/common/slid_drawn_button.dart';
import 'package:flutter/material.dart';

class CampaignShortcut extends StatelessWidget {
  const CampaignShortcut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SlidDrawnButton(
            color: Colors.pink[50]!,
            imageUrl: 'assets/img/donate.png',
            title: 'Donate',
          ),
          SlidDrawnButton(
            color: Colors.amber[50]!,
            imageUrl: 'assets/img/zakat.png',
            title: 'Zakat',
          ),
          SlidDrawnButton(
            color: Colors.cyan[50]!,
            imageUrl: 'assets/img/raise_fund.png',
            title: 'Raise Funds',
          ),
        ],
      ),
    );
  }
}
