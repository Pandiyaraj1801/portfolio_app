import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/images/app_images.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';
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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
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
  Widget build(BuildContext context) {
    double widthSz = MediaQuery.of(context).size.width;
    double heightSz = MediaQuery.of(context).size.height;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      // backgroundColor: AppColors.lightScaffoldColor,
      appBar: AppBar(
        toolbarHeight: heightSz * 0.17,
        leadingWidth: widthSz * 0.1,
        surfaceTintColor: theme.appBarTheme.backgroundColor,
        leading: Image.asset(AppImage.developerLogo, fit: BoxFit.cover),
        shape: Border(
          bottom: BorderSide(
            color: AppColors.greyColor.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),

      body: ListView(
        children: [
          /// Banner Image with name and role section
          _bannerImage(heightSz, widthSz, theme),

          /// Introduction overview section
          _introAboutMe(heightSz, widthSz, theme),

          SizedBox(height: heightSz * 0.1),

          /// Show Skills Tech Container Section
          Center(
            child: Text(
              "Skills",
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: widthSz * 0.025,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: heightSz * 0.03),

          /// Skill Card Carousel
          InfiniteCarousel(),

          /// Show Experience Tech Container Section
          Center(
            child: Text(
              "Experience",
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: widthSz * 0.025,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: heightSz * 0.03),

          /// Work Experiences Section
          WorkExperience(),

          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _bannerImage(double heightSz, double widthSz, ThemeData theme) {
    return Container(
      height: heightSz * 0.7,
      padding: EdgeInsets.symmetric(
        horizontal: widthSz * 0.05,
        vertical: heightSz * 0.02,
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
                  onFinished: () => setState(() {
                    showRole = true;
                  }),
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    ScrambleAnimatedText(
                      "J Pandiyaraj",
                      textStyle: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: widthSz * 0.06,
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
                      "Full Stack Developer",
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontSize: widthSz * 0.02,
                        color: AppColors.greyColor,
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
              offset: !start ? Offset(1.5, 0) : Offset(0, 0),
              curve: Curves.easeOut,
              child: Image.asset(AppImage.dashboardImg, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }

  Widget _introAboutMe(double heightSz, double widthSz, ThemeData theme) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedSlide(
      duration: Duration(seconds: 1),
      offset: start ? Offset(0, 0) : Offset(-1.5, 0),
      curve: Curves.easeOut,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthSz * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Introduction",
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: widthSz * 0.01,
              ),
            ),
            SizedBox(height: heightSz * 0.01),
            Text(
              "Overview.",
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: widthSz * 0.025,
                color: AppColors.greyColor,
              ),
            ),
            SizedBox(height: heightSz * 0.02),
            SizedBox(
              width: widthSz * 0.5,
              child: Text(
                ''' Flutter Developer with 2.4 years of experience building high-performance, real-time mobile applications. Strong expertise in REST API and WebSocket integration for seamless data communication. Proficient in state management using Provider and BLoC for scalable and maintainable apps. Hands-on experience developing trading, visitor tracking, and approval workflow applications. Skilled in backend integration using Go and MariaDB to deliver end-to-end solutions. Passionate about writing clean code, optimizing performance, and delivering reliable user experiences. ''',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: widthSz * 0.011,
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
