// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/education_projects/educations.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';

class EducationBox extends StatelessWidget {
  const EducationBox({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PersonalDetails.educations.map((edu) {
        return Container(
          height: AppResponsive.space(180),
          width: AppResponsive.space(170),
          padding: EdgeInsets.all(AppResponsive.space(7)),
          margin: EdgeInsets.symmetric(horizontal: AppResponsive.space(12)),
          decoration: BoxDecoration(
            color: AppColors.logoColor.withOpacity(0.13),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  iconSize: AppResponsive.font(15),
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
              ),

              SizedBox(height: AppResponsive.space(15)),

              Text(
                edu["institute"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: AppResponsive.font(9.5),
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: AppResponsive.space(3)),

              Text(
                edu["course"],
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: AppResponsive.font(7.1),
                  letterSpacing: 1,
                  fontWeight: FontWeight.normal,
                ),
              ),

              SizedBox(height: AppResponsive.space(6)),

              Text(
                edu["year"],
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: AppResponsive.font(7),
                  fontWeight: FontWeight.normal,
                  color: const Color(0xFF448AFF),
                ),
              ),

              SizedBox(height: AppResponsive.space(6)),

              Text(
                edu["orientation"],
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: AppResponsive.font(5),
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                  letterSpacing: 1,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
