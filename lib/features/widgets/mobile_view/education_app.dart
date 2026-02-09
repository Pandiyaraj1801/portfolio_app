// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/education_projects/userinfo.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';
import 'package:portfolio/core/widgets/header_txt.dart';

class EducationApp extends StatelessWidget {
  const EducationApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppResponsive.space(20)),

        TxtHeader(txt: "Educations", fontSize: 23),

        SizedBox(height: AppResponsive.space(20)),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: InstituteDetails.educations
              .map(
                (edu) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppResponsive.space(5),
                    vertical: AppResponsive.space(8),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(AppResponsive.space(7)),
                    margin: EdgeInsets.symmetric(
                      horizontal: AppResponsive.space(12),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.logoColor.withOpacity(0.13),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: AppResponsive.font(30),
                              constraints: BoxConstraints(
                                minWidth: AppResponsive.space(30),
                                minHeight: AppResponsive.space(30),
                              ),
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  AppColors.greyColor,
                                ),
                              ),
                              onPressed: null,
                              icon: Icon(edu["icon"]),
                            ),

                            SizedBox(width: AppResponsive.space(10)),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    edu["institute"],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.displayMedium
                                        ?.copyWith(
                                          fontSize: AppResponsive.font(25),
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),

                                  SizedBox(height: AppResponsive.space(5)),

                                  Text(
                                    edu["course"],
                                    style: theme.textTheme.displayMedium
                                        ?.copyWith(
                                          fontSize: AppResponsive.font(18),
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),

                                  SizedBox(height: AppResponsive.space(5)),

                                  Text(
                                    edu["year"],
                                    style: theme.textTheme.displayMedium
                                        ?.copyWith(
                                          fontSize: AppResponsive.font(15),
                                          fontWeight: FontWeight.normal,
                                          color: const Color(0xFF448AFF),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: AppResponsive.space(15)),

                        Text(
                          edu["orientation"],
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontSize: AppResponsive.font(15),
                            fontWeight: FontWeight.normal,
                            height: 1.5,
                            letterSpacing: 1,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
