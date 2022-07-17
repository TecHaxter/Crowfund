import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:crowfund/utils/spacing.dart';
import 'package:crowfund/widgets/common/file_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's share goodness",
            style: TextStyle(
              fontSize: 24.ssp,
              fontWeight: FontWeight.w800,
            ),
          ),
          sizedBoxWithHeight(8),
          Text(
            "Good people help each other",
            style: TextStyle(
              fontSize: 14.ssp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          sizedBoxWithHeight(28),
          RotationTransition(
            turns: const AlwaysStoppedAnimation(-1 / 360),
            child: InkWell(
              onTap: () {},
              child: FileCard(
                height: 60.h,
                width: double.maxFinite,
                isShifted: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 18.0,
                          ),
                          sizedBoxWithWidth(12),
                          const Text("Search here...")
                        ],
                      ),
                      const FaIcon(FontAwesomeIcons.sliders, size: 18.0)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
