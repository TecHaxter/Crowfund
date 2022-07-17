import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:crowfund/utils/spacing.dart';
import 'package:crowfund/widgets/common/notification_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonateAppBar extends StatefulWidget {
  const DonateAppBar({Key? key}) : super(key: key);

  @override
  State<DonateAppBar> createState() => _DonateAppBarState();
}

class _DonateAppBarState extends State<DonateAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 34.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              NotificationIcon(
                main: Container(
                  width: 36.r,
                  height: 36.r,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(18.r),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://media-exp1.licdn.com/dms/image/C5603AQE-9x2AgYVwHg/profile-displayphoto-shrink_200_200/0/1561033105397?e=1661385600&v=beta&t=RLlC4JdPTqa-Orl6eJwt-2KW6MiBuJ3VVdqjzPsdvdk"),
                    ),
                  ),
                ),
                notiText: '2',
                bgColor: Colors.green[300],
                textColor: Colors.white,
              ),
              sizedBoxWithWidth(16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Afternoon",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.ssp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Mira Suxi",
                    style: TextStyle(
                      fontSize: 22.ssp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
          NotificationIcon(
            main: Padding(
              padding: EdgeInsets.all(6.r),
              child: FaIcon(
                FontAwesomeIcons.bell,
                size: 18.r,
              ),
            ),
            notiText: '2',
            bgColor: Colors.red[300],
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
