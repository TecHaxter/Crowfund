import 'package:crowfund/utils/extensions/list_extension.dart';
import 'package:crowfund/utils/extensions/size_extension.dart';
import 'package:crowfund/utils/screen_config.dart';
import 'package:crowfund/utils/spacing.dart';
import 'package:crowfund/views/donate/donate.dart';
import 'package:crowfund/views/inbox.dart';
import 'package:crowfund/views/profile.dart';
import 'package:crowfund/views/work.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crowfund',
      scrollBehavior: MyScrollBehavior(),
      theme: _buildTheme(Brightness.light),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Crowfund'),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();

  List bottomNavBarButtons = [
    [FontAwesomeIcons.solidHand, FontAwesomeIcons.hand, 'Donation'],
    [
      FontAwesomeIcons.solidWindowMaximize,
      FontAwesomeIcons.windowMaximize,
      'Work'
    ],
    [FontAwesomeIcons.solidEnvelope, FontAwesomeIcons.envelope, 'Inbox'],
    [FontAwesomeIcons.solidCircleUser, FontAwesomeIcons.circleUser, 'Profile'],
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          onPageChanged: (page) {
            setState(() {
              selectedIndex = page;
            });
          },
          controller: _pageController,
          children: const [Donate(), Work(), Inbox(), Profile()],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h),
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: const Color(0xff127681),
            border: Border.all(width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: bottomNavBarButtons.mapIndexed(
              (index, List item) {
                if (index == selectedIndex) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(width: 2.0),
                    ),
                    child: Row(
                      children: [
                        FaIcon(
                          item[0],
                          color: Colors.black,
                          size: 18.0,
                        ),
                        sizedBoxWithWidth(8),
                        Text(
                          item[2],
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  );
                }
                return InkWell(
                  onTap: () {
                    _pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(
                      item[1],
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
