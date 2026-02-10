// ignore_for_file: deprecated_member_use

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/education_projects/userinfo.dart';
import 'package:portfolio/core/constant/images/app_images.dart';
import 'package:portfolio/core/constant/images/images.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';
import 'package:portfolio/core/widgets/header_txt.dart';
import 'package:portfolio/features/screens/mobile_view/mobile_view.dart';
import 'package:portfolio/features/widgets/educations.dart';
import 'package:portfolio/features/widgets/info_details.dart';
import 'package:portfolio/features/widgets/projects.dart';
import 'package:portfolio/features/widgets/skill_carousel_card.dart';
import 'package:portfolio/features/widgets/work_experience.dart';
import 'package:shimmer/shimmer.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool start = false;
  bool showRole = false;
  String selectedTxt = "";
  final ScrollController _scrollController = ScrollController();
  final List<DashboardItem> dashboards = [
    DashboardItem(title: "About", icon: Icons.person, key: GlobalKey()),
    DashboardItem(title: "Skills", icon: Icons.build, key: GlobalKey()),
    DashboardItem(title: "Experience", icon: Icons.work, key: GlobalKey()),
    DashboardItem(title: "Education", icon: Icons.school, key: GlobalKey()),
    DashboardItem(title: "Projects", icon: Icons.cloud, key: GlobalKey()),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      start = !start;
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setState(() {
      showRole = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final context = key.currentContext;
      if (context == null) return;

      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      // backgroundColor: AppColors.lightScaffoldColor,
      appBar: AppBar(
        toolbarHeight: AppResponsive.space(70),
        leadingWidth: AppResponsive.space(100),
        surfaceTintColor: theme.appBarTheme.backgroundColor,
        leading: Image.asset(AppImage.developerLogo, fit: BoxFit.cover),
        shape: Border(
          bottom: BorderSide(
            color: AppColors.greyColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        actions: AppResponsive.width > 700
            ? dashboards.map((e) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppResponsive.w(0.01),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                        AppColors.transparentColor,
                      ),
                    ),
                    onPressed: () {
                      scrollToSection(e.key);
                      selectedTxt = e.title;
                      setState(() {});
                    },
                    child: Text(
                      e.title,
                      style: theme.textTheme.displayMedium?.copyWith(
                        letterSpacing: 2,
                        fontSize: AppResponsive.font(10),
                        fontWeight: FontWeight.bold,
                        color: selectedTxt == e.title ? Colors.amber : null,
                      ),
                    ),
                  ),
                );
              }).toList()
            : null,
      ),

      endDrawer: AppResponsive.width < 700
          ? Drawer(
              width: AppResponsive.w(0.6),
              child: ListView(
                children: [
                  Stack(
                    clipBehavior: Clip.none, // 🔥 IMPORTANT
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.drawerProfileBgColor,
                          border: const Border(
                            bottom: BorderSide(color: Colors.white70),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: AppResponsive.w(0.05),
                          horizontal: AppResponsive.w(0.015),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColors.darkScaffoldColor,
                              backgroundImage: AssetImage(
                                ImagePath.profliepicImg,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${PersonalDetails.username} J",
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: AppResponsive.font(17),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              PersonalDetails.emailAccount,
                              style: theme.textTheme.displayMedium?.copyWith(
                                color: AppColors.greyColor,
                                letterSpacing: 1,
                                fontSize: AppResponsive.font(12),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ✅ FULL icon overlaying border line
                      Positioned(
                        bottom: -10,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.star,
                            size: AppResponsive.icon(14),
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppResponsive.space(10)),

                  ...dashboards.map((e) {
                    return ListTile(
                      minVerticalPadding: AppResponsive.space(10),
                      minLeadingWidth: 0,
                      minTileHeight: 0,
                      horizontalTitleGap: AppResponsive.space(10),
                      leading: Icon(e.icon, size: AppResponsive.font(17)),
                      onTap: () {
                        selectedTxt = e.title;
                        setState(() {});
                        scrollToSection(e.key);
                        Navigator.of(context).maybePop();
                      },
                      title: Text(
                        e.title,
                        style: theme.textTheme.displayMedium?.copyWith(
                          color: AppColors.greyColor,
                          letterSpacing: 1,
                          fontSize: AppResponsive.font(14),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            )
          : null,

      body: AppResponsive.width < 700
          ? MoblieViewApp(
              scrollController: _scrollController,
              selectedTxt: selectedTxt,
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Introduction and navbar sections
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    key: dashboards[0].key,
                    children: [
                      /// Banner Image with name and role section
                      _bannerImage(theme),

                      /// Introduction overview section
                      _introAboutMe(theme),
                    ],
                  ),

                  SizedBox(height: AppResponsive.space(60)),

                  /// Show Skills Tech Container Section
                  Column(
                    key: dashboards[1].key,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TxtHeader(txt: "Skills", fontSize: 17),

                      SizedBox(height: AppResponsive.space(10)),

                      /// Skill Card Carousel
                      InfiniteCarousel(),
                    ],
                  ),

                  /// Show Experience Tech Container Section
                  Column(
                    key: dashboards[2].key,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TxtHeader(txt: "Work Experience", fontSize: 17),

                      SizedBox(height: AppResponsive.space(20)),

                      /// Work Experiences Section
                      WorkExperience(),
                    ],
                  ),

                  SizedBox(height: AppResponsive.space(30)),

                  /// Educations
                  Column(
                    key: dashboards[3].key,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TxtHeader(txt: "Educations", fontSize: 17),

                      SizedBox(height: AppResponsive.space(20)),

                      EducationBox(),
                    ],
                  ),

                  SizedBox(height: AppResponsive.space(30)),

                  /// Projects
                  Column(
                    key: dashboards[4].key,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TxtHeader(txt: "Projects", fontSize: 17),

                      SizedBox(height: AppResponsive.space(20)),

                      Center(child: ProjectsView()),
                    ],
                  ),

                  SizedBox(height: AppResponsive.space(50)),

                  /// InfoDetails
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppResponsive.space(50),
                    ),
                    child: Column(
                      key: dashboards[5].key,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),

                        SizedBox(height: AppResponsive.space(10)),

                        InfoDetails(),

                        SizedBox(height: AppResponsive.space(15)),

                        Center(
                          child: Text(
                            "© 2026 Pandiyaraj. Crafted with passion and attention to detail.",
                            style: theme.textTheme.displayMedium?.copyWith(
                              color: AppColors.greyColor,
                              letterSpacing: 1,
                              fontSize: AppResponsive.font(6),
                            ),
                          ),
                        ),

                        SizedBox(height: AppResponsive.space(10)),

                        Divider(),
                      ],
                    ),
                  ),

                  SizedBox(height: AppResponsive.space(50)),
                ],
              ),
            ),
    );
  }

  Widget _bannerImage(ThemeData theme) {
    return Container(
      height: AppResponsive.h(0.7),
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(0.04),
        vertical: AppResponsive.h(0.02),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextKit(
                  key: ValueKey(Theme.of(context).brightness),
                  onFinished: () {
                    if (!mounted) return;
                    setState(() {
                      showRole = true;
                    });
                  },
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    ScrambleAnimatedText(
                      "J ${PersonalDetails.username}",
                      textStyle: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: AppResponsive.font(35),
                        letterSpacing: 1.5,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                ),

                AnimatedSlide(
                  duration: Duration(seconds: 1),
                  offset: start ? Offset(0, 0) : Offset(-1.5, 0),
                  curve: Curves.easeOut,
                  child: Shimmer.fromColors(
                    baseColor:
                        theme.textTheme.bodyLarge?.color ?? AppColors.greyColor,
                    highlightColor: AppColors.animateTxtColor,
                    child: Text(
                      "Full Stack Developer.",
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontSize: AppResponsive.font(14),
                        color: AppColors.greyColor,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: AnimatedSlide(
              duration: Duration(seconds: 1),
              offset: !start ? Offset(1, 0) : Offset(0, 0),
              curve: Curves.easeOut,
              child: Image.asset(AppImage.dashboardImg, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }

  Widget _introAboutMe(ThemeData theme) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedSlide(
      duration: Duration(seconds: 1),
      offset: start ? Offset(0, 0) : Offset(-1, 0),
      curve: Curves.easeOut,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppResponsive.space(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Introduction",
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: AppResponsive.font(9),
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: AppResponsive.h(0.01)),
            Text(
              "Overview.",
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: AppResponsive.font(20),
                color: AppColors.greyColor,
              ),
            ),
            SizedBox(height: AppResponsive.h(0.02)),
            SizedBox(
              width: AppResponsive.w(0.5),
              child: Text(
                ''' Flutter Developer with 2.4 years of experience building high-performance, real-time mobile applications. Strong expertise in REST API and WebSocket integration for seamless data communication. Proficient in state management using Provider and BLoC for scalable and maintainable apps. Hands-on experience developing trading, visitor tracking, and approval workflow applications. Skilled in backend integration using Go and MariaDB to deliver end-to-end solutions. Passionate about writing clean code, optimizing performance, and delivering reliable user experiences. ''',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: AppResponsive.font(8),
                  color: isDark ? AppColors.greyColor : AppColors.blackColor,
                  letterSpacing: 1,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
