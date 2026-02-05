import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/images/app_images.dart';
import 'package:portfolio/core/constant/url_configs/urls.dart';
import 'package:portfolio/core/methods/app_methods/methods.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';
import 'package:portfolio/core/widgets/header_txt.dart';

class ExperienceApp extends StatelessWidget {
  const ExperienceApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppResponsive.space(20)),

        TxtHeader(txt: "Work Experience", fontSize: 23),

        InkWell(
          onTap: () => AppMethods.openUrl(AppUrls.flattradeUrl),
          overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
          child: Padding(
            padding: EdgeInsets.all(AppResponsive.space(5)),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppResponsive.space(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppResponsive.h(0.3),
                      width: double.infinity,
                      child: Image.asset(
                        AppImage.flattradeImg,
                        fit: BoxFit.cover,
                        width: AppResponsive.w(0.10),
                      ),
                    ),

                    SizedBox(
                      height: AppResponsive.h(0.1),
                      child: Image.asset(
                        AppImage.flattradeBannerImg,
                        fit: BoxFit.cover,
                        width: AppResponsive.w(0.5),
                      ),
                    ),

                    Text(
                      "Fortune Capital Services",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: AppResponsive.font(14),
                        letterSpacing: 2,
                      ),
                    ),

                    Text(
                      "(Jun 2023 - Oct 2025)",
                      style: theme.textTheme.displayMedium?.copyWith(
                        letterSpacing: 1.3,
                        fontSize: AppResponsive.font(11),
                        height: 1.7,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      '''The company was established as Fortune Capital Services Private Limited in the year 2004. To date, it is one of the most recognized and rapidly growing financial stock brokerages in the country. We have several branches present in the major cities of India, including the headquarters located in Chennai.''',
                      style: theme.textTheme.displayMedium?.copyWith(
                        letterSpacing: 1.3,
                        fontSize: AppResponsive.font(9),
                        height: 1.5,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      '''© 2026. FLATTRADE is online brand of  Fortune Capital Services P Ltd.''',
                      style: theme.textTheme.displayMedium?.copyWith(
                        letterSpacing: 1,
                        fontSize: AppResponsive.font(9),
                        height: 1.5,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
