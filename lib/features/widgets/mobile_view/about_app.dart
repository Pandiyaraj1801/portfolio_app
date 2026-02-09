// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constant/education_projects/userinfo.dart';
import 'package:portfolio/core/constant/images/images.dart';
import 'package:portfolio/core/constant/url_configs/urls.dart';
import 'package:portfolio/core/methods/app_methods/methods.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppResponsive.space(50)),

          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              /// 🔹 Main Card
              Container(
                width: AppResponsive.w(0.8),
                margin: EdgeInsets.only(top: AppResponsive.space(60)),
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.logoColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: AppResponsive.space(8)),
                    Text(
                      "J ${PersonalDetails.username}",
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(
                            fontSize: AppResponsive.font(17),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                    ),
                    SizedBox(height: AppResponsive.space(8)),
                    Text(
                      "@Code Dev",
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(
                            fontSize: AppResponsive.font(13),
                            color: AppColors.greyColor,
                          ),
                    ),

                    SizedBox(height: AppResponsive.space(30)),

                    mobileInfoAddr(
                      FontAwesomeIcons.cakeCandles,
                      "18.01.2002",
                      theme,
                    ),

                    SizedBox(height: AppResponsive.space(10)),

                    mobileInfoAddr(
                      FontAwesomeIcons.code,
                      "Full Stack Developer",
                      theme,
                    ),

                    SizedBox(height: AppResponsive.space(10)),

                    mobileInfoAddr(
                      FontAwesomeIcons.laptopCode,
                      "Flutter | Golang | Vuejs",
                      theme,
                    ),

                    SizedBox(height: AppResponsive.space(20)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mobileInfoAddr(
                          FontAwesomeIcons.locationDot,
                          "Madurai",
                          theme,
                        ),

                        mobileInfoAddr(Icons.school, "B.com(B&I)", theme),
                      ],
                    ),

                    SizedBox(height: AppResponsive.space(15)),

                    Text(
                      "© 2026 Pandiyaraj. Crafted with passion and attention to detail.",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontSize: AppResponsive.font(11),
                        color: AppColors.greyColor,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔹 Profile Image (Outside Card)
              Positioned(
                top: 0,
                child: Container(
                  height: AppResponsive.space(120),
                  width: AppResponsive.space(130),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      ImagePath.profileDpImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppResponsive.space(20)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(0.08)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 LEFT CARD
                Expanded(
                  flex: 50,
                  child: socialMedia(
                    FontAwesomeIcons.linkedin,
                    "LinkedIn",
                    "Pandiya Raj",
                    theme,
                    AppUrls.linkedInUrl,
                  ),
                ),

                /// 🔹 RIGHT CARD
                Expanded(
                  flex: 50,
                  child: socialMedia(
                    FontAwesomeIcons.github,
                    "GitHub",
                    "Pandiyaraj1801",
                    theme,
                    AppUrls.gitHubUrl,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppResponsive.space(15)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(0.08)),
            child: socialMedia(
              Icons.email,
              "Email",
              PersonalDetails.emailAccount,
              theme,
              AppUrls.emailUrl,
            ),
          ),

          SizedBox(height: AppResponsive.space(15)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(0.08)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 LEFT CARD
                Expanded(
                  flex: 50,
                  child: socialMedia(
                    FontAwesomeIcons.dev,
                    "Daily Dev",
                    "@pandiyaraj",
                    theme,
                    AppUrls.dailyDevUrl,
                  ),
                ),

                /// 🔹 RIGHT CARD
                Expanded(
                  flex: 50,
                  child: socialMedia(
                    FontAwesomeIcons.medium,
                    "Medium",
                    PersonalDetails.username,
                    theme,
                    AppUrls.mediumUrl,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppResponsive.space(20)),
        ],
      ),
    );
  }
}

Widget mobileInfoAddr(dynamic pIcon, String txt, ThemeData theme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(pIcon, size: AppResponsive.font(16), color: AppColors.primaryColor),
      SizedBox(width: AppResponsive.space(5)),
      Text(
        txt,
        style: theme.textTheme.displayMedium?.copyWith(
          fontSize: AppResponsive.font(13),
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    ],
  );
}

Widget socialMedia(
  dynamic icons,
  String mediaTxt,
  String userId,
  ThemeData theme,
  String url,
) {
  return InkWell(
    onTap: () => AppMethods.openUrl(url),
    child: Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.logoColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icons, size: AppResponsive.font(60)),
              Icon(FontAwesomeIcons.link, size: AppResponsive.font(12)),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            mediaTxt,
            style: theme.textTheme.displayMedium?.copyWith(
              fontSize: AppResponsive.font(18),
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            userId,
            style: theme.textTheme.displayMedium?.copyWith(
              fontSize: AppResponsive.font(13),
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    ),
  );
}
