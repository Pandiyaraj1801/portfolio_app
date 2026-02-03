import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/images/app_images.dart';
import 'package:portfolio/core/constant/url_configs/urls.dart';
import 'package:portfolio/core/methods/app_methods/methods.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  bool start = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      start = !start;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedSlide(
          duration: const Duration(seconds: 1),
          offset: start ? const Offset(0, 0) : const Offset(-1.5, 0),
          curve: Curves.easeOut,
          child: Image.asset(
            AppImage.flattradeImg,
            fit: BoxFit.cover,
            height: AppResponsive.space(200),
            width: AppResponsive.space(300),
          ),
        ),

        SizedBox(
          height: AppResponsive.space(220),
          child: VerticalDivider(
            color: AppColors.greyColor,
            thickness: 1.5,
            width: AppResponsive.w(0.02),
          ),
        ),

        SizedBox(
          width: AppResponsive.space(330),
          child: AnimatedSlide(
            duration: const Duration(seconds: 1),
            offset: !start ? const Offset(1.5, 0) : const Offset(0, 0),
            curve: Curves.easeOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fortune Capital Services",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: AppResponsive.font(20),
                    letterSpacing: 2,
                  ),
                ),

                SizedBox(
                  height: AppResponsive.space(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImage.flattradeBannerImg,
                        fit: BoxFit.cover,
                        width: AppResponsive.w(0.10),
                      ),

                      SizedBox(width: 7),

                      Text(
                        "(Jun 2023 - Oct 2025)",
                        style: theme.textTheme.displayMedium?.copyWith(
                          letterSpacing: 1.3,
                          fontSize: AppResponsive.font(9),
                          height: 1.7,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  '''The company was established as Fortune Capital Services Private Limited in the year 2004. To date, it is one of the most recognized and rapidly growing financial stock brokerages in the country. We have several branches present in the major cities of India, including the headquarters located in Chennai.''',
                  style: theme.textTheme.displayMedium?.copyWith(
                    letterSpacing: 1.3,
                    fontSize: AppResponsive.font(5),
                    height: 1.5,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  '''© 2026. FLATTRADE is online brand of  Fortune Capital Services P Ltd.''',
                  style: theme.textTheme.displayMedium?.copyWith(
                    letterSpacing: 1,
                    fontSize: AppResponsive.font(6.5),
                    height: 1.5,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                    Expanded(
                      child: Text(
                        '''6th Floor, Kochar Technology Park, SP 31-A, 1st Cross Rd, Sai Nagar, Ambattur Industrial Estate, Chennai, Tamil Nadu 600058''',
                        style: theme.textTheme.displayMedium?.copyWith(
                          letterSpacing: 1,
                          fontSize: AppResponsive.font(6.5),
                          height: 1.5,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: AppResponsive.space(20)),

                InkWell(
                  overlayColor: WidgetStatePropertyAll(
                    AppColors.transparentColor,
                  ),
                  onTap: () => AppMethods.openUrl(AppUrls.flattradeUrl),
                  child: Text(
                    "see more...",
                    style: theme.textTheme.displayMedium?.copyWith(
                      letterSpacing: 1.2,
                      fontSize: AppResponsive.font(8),
                      fontWeight: FontWeight.normal,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
