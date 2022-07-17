import 'dart:math';
import 'dart:ui';
import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:crowfund/utils/spacing.dart';
import 'package:crowfund/widgets/common/file_card.dart';
import 'package:crowfund/widgets/common/stitch.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void showPaymentSheet(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.white38,
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: max(0.001, anim1.value * 4.0),
        sigmaY: max(0.001, anim1.value * 4.0),
      ),
      child: FadeTransition(
        child: child,
        opacity: anim1,
      ),
    ),
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return const PaymentSheet();
    },
  );
}

class PaymentSheet extends StatelessWidget {
  const PaymentSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 32.h,
                child: FileCard(
                  width: double.maxFinite,
                  height: 600.h,
                  rotate: -4 / 360,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        sizedBoxWithHeight(16),
                        Text(
                          "Enter Donation Amount",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.ssp,
                          ),
                        ),
                        sizedBoxWithHeight(8),
                        Text(
                          "Enter the nominal according to your ability",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 12.ssp,
                          ),
                        ),
                        sizedBoxWithHeight(16),
                        SizedBox(
                          width: double.maxFinite,
                          height: 135.h,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned.fill(
                                top: 18.h,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: DottedBorder(
                                    strokeWidth: 3.0,
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      color: Colors.cyan[50],
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 24.h,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("USD"),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 28.r,
                                                    height: 28.r,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 3.0,
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        14.r,
                                                      ),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Flag_of_the_United_States_%281795%E2%80%931818%29.svg/220px-Flag_of_the_United_States_%281795%E2%80%931818%29.svg.png'),
                                                      ),
                                                    ),
                                                  ),
                                                  sizedBoxWithWidth(8),
                                                  FaIcon(
                                                    FontAwesomeIcons.angleDown,
                                                    size: 12.0,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Text(
                                            "50.00",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.ssp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0.0,
                                top: 0.0,
                                child: Stitch(
                                  length: 60.w,
                                  rotate: 60 / 360,
                                ),
                              ),
                              Positioned(
                                right: 0.0,
                                top: 0.0,
                                child: Stitch(
                                  length: 60.w,
                                  rotate: -60 / 360,
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(16),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Payment Method",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.ssp,
                              ),
                            ),
                          ),
                        ),
                        sizedBoxWithHeight(16),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 16.r,
                                    backgroundColor: Colors.cyan[400],
                                    child: FaIcon(
                                      FontAwesomeIcons.wallet,
                                      color: Colors.white,
                                      size: 14.r,
                                    ),
                                  ),
                                  sizedBoxWithWidth(4),
                                  Text(
                                    "gopay",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18.ssp,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 2.0)),
                                child: Row(
                                  children: [
                                    Text(
                                      'Change',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    sizedBoxWithWidth(8),
                                    FaIcon(
                                      FontAwesomeIcons.angleDown,
                                      size: 12.0,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(16),
                        SizedBox(
                          width: double.maxFinite,
                          height: 130.h,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned.fill(
                                top: 18.h,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: DottedBorder(
                                    strokeWidth: 3.0,
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      color: Colors.yellow[50],
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 24.h,
                                      ),
                                      width: double.maxFinite,
                                      height: double.maxFinite,
                                      child: Text('Prey for this donation'),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0.0,
                                bottom: 16.h,
                                child: Stitch(
                                  length: 40.w,
                                  rotate: -20 / 360,
                                ),
                              ),
                              Positioned(
                                right: 0.0,
                                top: 32.h,
                                child: Stitch(
                                  length: 40.w,
                                  rotate: 20 / 360,
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(28),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Next to Payment',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.ssp,
                                ),
                              ),
                              FileCard(
                                child: Center(
                                  child:
                                      FaIcon(FontAwesomeIcons.solidPaperPlane),
                                ),
                                isShifted: true,
                                height: 50.h,
                                width: 90.w,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 600.h,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 56.r,
                    height: 56.r,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      color: const Color(0xff127681),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      width: 32.r,
                      height: 32.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.amber,
                        border: Border.all(width: 2),
                      ),
                      alignment: Alignment.center,
                      child: const FaIcon(FontAwesomeIcons.xmark),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
