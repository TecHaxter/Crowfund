import 'package:crowfund/models/campaign.dart';
import 'package:crowfund/utils/extensions/list_extension.dart';
import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:crowfund/utils/spacing.dart';
import 'package:crowfund/views/donate/widgets/campaign_info_card.dart';
import 'package:crowfund/widgets/common/file_card.dart';
import 'package:crowfund/widgets/common/stitch.dart';
import 'package:flutter/material.dart';

class TrendingCampaign extends StatelessWidget {
  final List campaignSpaceCardStitchPairs;
  final List<Campaign> campaigns;
  const TrendingCampaign(
      {Key? key,
      required this.campaigns,
      required this.campaignSpaceCardStitchPairs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Campaign',
                style: TextStyle(
                  fontSize: 18.ssp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 18.ssp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Container(
                      height: 2.h,
                      width: 50.w,
                      color: Colors.amber,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        sizedBoxWithHeight(14),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 250.h,
            width: campaignSpaceCardStitchPairs.length * 310.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ...campaignSpaceCardStitchPairs.mapIndexed(
                  ((index, List item) {
                    return Positioned(
                      left: item[0] + (300.w * index),
                      child: FileCard(
                        child: CampaignInfoCard(
                          campaign: campaigns[index],
                        ),
                        rotate: item[1],
                        height: 210.h,
                        width: 270.w,
                      ),
                    );
                  }),
                ).toList(),
                ...campaigns
                    .mapIndexed(
                      ((index, item) => Positioned(
                            top: campaignSpaceCardStitchPairs[index][3],
                            bottom: campaignSpaceCardStitchPairs[index][4],
                            left: campaignSpaceCardStitchPairs[index][2] +
                                (300.w * index),
                            child: Stitch(
                                length: campaignSpaceCardStitchPairs[index][5],
                                rotate: campaignSpaceCardStitchPairs[index][6]),
                          )),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
        sizedBoxWithHeight(32)
      ],
    );
  }
}
