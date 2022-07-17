import 'dart:math';
import 'dart:ui';

import 'package:crowfund/models/campaign.dart';
import 'package:crowfund/utils/extensions/list_extension.dart';
import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:crowfund/utils/spacing.dart';
import 'package:crowfund/views/donate/payment_sheet.dart';
import 'package:crowfund/widgets/common/category_chip.dart';
import 'package:crowfund/widgets/common/file_card.dart';
import 'package:crowfund/widgets/common/read_more.dart';
import 'package:crowfund/widgets/common/stitch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CampaignDetail extends StatelessWidget {
  final Campaign campaign;
  const CampaignDetail({Key? key, required this.campaign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List randomCategoryTagColor = [
      Colors.pink,
      Colors.amber,
      Colors.green,
      Colors.blueGrey
    ];
    randomCategoryTagColor.shuffle();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxWithHeight(28),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const FaIcon(FontAwesomeIcons.arrowLeft,
                          size: 18.0, color: Colors.black54),
                    ),
                    const Text(
                      "Campaign Detail",
                      style: TextStyle(color: Colors.black87),
                    ),
                    const FaIcon(FontAwesomeIcons.shareNodes,
                        size: 18.0, color: Colors.black54),
                  ],
                ),
              ),
              SizedBox(
                height: 250.h,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    FileCard(
                      child: Image.network(
                        campaign.images!.first,
                        fit: BoxFit.cover,
                      ),
                      rotate: -5 / 360,
                      height: 200.h,
                      width: 300.w,
                    ),
                    Positioned(
                      bottom: 50.h,
                      left: 5.w,
                      child: Stitch(length: 60.w, rotate: -12 / 360),
                    ),
                    Positioned(
                      top: 30.h,
                      right: 0.w,
                      child: Stitch(length: 80.w, rotate: -40 / 360),
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      campaign.name ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.ssp,
                      ),
                    ),
                    sizedBoxWithHeight(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'By ${campaign.provider ?? ''}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.red[300],
                          size: 18.0,
                        )
                      ],
                    ),
                    sizedBoxWithHeight(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          ...campaign.category!
                              .mapIndexed(
                                (index, item) => Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: CategoryChip(
                                    text: item as String,
                                    fontSize: 10.ssp,
                                    color: randomCategoryTagColor[index],
                                  ),
                                ),
                              )
                              .toList()
                        ]),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.locationDot,
                              size: 14.0,
                            ),
                            sizedBoxWithWidth(8),
                            Text(
                              campaign.location ?? '',
                              style: TextStyle(fontSize: 10.ssp),
                            )
                          ],
                        )
                      ],
                    ),
                    sizedBoxWithHeight(16),
                    SizedBox(
                      height: 10.h,
                      width: double.maxFinite,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 5.h,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            right: 100.w,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green[300],
                                border: Border.all(),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 1.0,
                              ),
                              child: const Text(
                                '/ / / / / / / / / / / / / / / / / / / / / / / / / / / / / / /',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    sizedBoxWithHeight(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Target: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                            children: [
                              TextSpan(
                                text: '\$${campaign.target}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              )
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Raised: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            children: [
                              TextSpan(
                                text: '\$${campaign.raised}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green[400],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(8),
                    Divider(
                      height: 30,
                      color: Colors.black,
                    ),
                    sizedBoxWithHeight(8),
                    Text(
                      "About Campaign",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.ssp,
                      ),
                    ),
                    sizedBoxWithHeight(16),
                    ExpandableText(
                      campaign.about ?? 'sdsd',
                      trimLines: 4,
                      readMoreStyle: TextStyle(
                          color: Colors.orange[300],
                          fontWeight: FontWeight.w600),
                      textStyle: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    sizedBoxWithHeight(24),
                    InkWell(
                      onTap: () {
                        showPaymentSheet(context);
                      },
                      child: RotationTransition(
                        turns: const AlwaysStoppedAnimation(1 / 260),
                        child: FileCard(
                          child: Center(
                              child: Text(
                            "Donate Campaign",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14.ssp,
                            ),
                          )),
                          height: 60.h,
                          width: double.maxFinite,
                          isShifted: true,
                        ),
                      ),
                    ),
                    sizedBoxWithHeight(16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
