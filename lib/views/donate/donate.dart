import 'dart:math';

import 'package:crowfund/models/campaign.dart';
import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:crowfund/utils/spacing.dart';
import 'package:crowfund/views/donate/widgets/campaign_shortcut.dart';
import 'package:crowfund/views/donate/widgets/search_bar.dart';
import 'package:crowfund/views/donate/widgets/trending_campaign.dart';
import 'package:crowfund/views/donate/widgets/donate_appbar.dart';
import 'package:flutter/material.dart';

class Donate extends StatefulWidget {
  const Donate({Key? key}) : super(key: key);

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  List spaceCardStitchPairs = [
    // [cardSpace, cardRotion, stitchLeftSpace, stitchTopSpace, stitchBottomSpace, stitchLength, stichRotation]
    [20.w, 5 / 360, -30.w, 0.0, 0.0, 80.w, -2 / 360],
    [45.w, -3 / 360, -25.w, 50.h, 0.0, 90.w, 8 / 360],
    [30.w, -4 / 360, -25.w, 80.h, 0.0, 80.w, -8 / 360],
  ];

  List campaignSpaceCardStitchPairs = [];

  @override
  void initState() {
    super.initState();
    populatePositionsFromApi();
  }

  void populatePositionsFromApi() {
    final rnd = Random();
    campaignSpaceCardStitchPairs = [];
    for (var _ in campaigns) {
      campaignSpaceCardStitchPairs
          .add(spaceCardStitchPairs[rnd.nextInt(spaceCardStitchPairs.length)]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          sizedBoxWithHeight(28),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const DonateAppBar(),
          ),
          sizedBoxWithHeight(28),
          const SearchBar(),
          sizedBoxWithHeight(32),
          const CampaignShortcut(),
          sizedBoxWithHeight(32),
          TrendingCampaign(
            campaignSpaceCardStitchPairs: campaignSpaceCardStitchPairs,
            campaigns: campaigns,
          ),
        ],
      ),
    );
  }
}
