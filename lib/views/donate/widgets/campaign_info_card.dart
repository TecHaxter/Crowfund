import 'package:crowfund/models/campaign.dart';
import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:crowfund/utils/spacing.dart';
import 'package:crowfund/views/donate/campaign_detail.dart';
import 'package:crowfund/widgets/common/category_chip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CampaignInfoCard extends StatelessWidget {
  final Campaign campaign;
  const CampaignInfoCard({Key? key, required this.campaign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List randomCategoryTagColor = [
      Colors.pink,
      Colors.amber,
      Colors.green,
      Colors.blueGrey
    ];
    randomCategoryTagColor.shuffle();
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CampaignDetail(
              campaign: campaign,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 150.h,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 18.w),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(campaign.images!.first),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryChip(
                      text: campaign.category!.first,
                      color: randomCategoryTagColor.first,
                    ),
                    FaIcon(
                      campaign.liked ?? false
                          ? FontAwesomeIcons.solidHeart
                          : FontAwesomeIcons.heart,
                      size: 18,
                      color: Colors.white,
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  campaign.name!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 22.ssp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  campaign.provider!,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: double.maxFinite,
            height: 5,
            color: Colors.grey[300],
            child: Stack(
              children: [
                Container(
                  width: 150.w,
                  height: 5,
                  color: Colors.green[200],
                ),
              ],
            ),
          ),
          sizedBoxWithHeight(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Target: \$${campaign.target}"),
              Text(
                "${((campaign.raised! / campaign.target!) * 100).toStringAsFixed(2)}%",
                style: TextStyle(
                    color: Colors.green[200], fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
