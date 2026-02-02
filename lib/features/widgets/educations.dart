import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/education_projects/educations.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';

class EducationBox extends StatelessWidget {
  const EducationBox({super.key});

  @override
  Widget build(BuildContext context) {
    double widthSz = MediaQuery.of(context).size.width;
    double heightSz = MediaQuery.of(context).size.height;
    ThemeData theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthSz * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: EducationsApp.educations.map((edu) {
          return Container(
            height: heightSz * 0.4,
            width: widthSz * 0.2,
            padding: EdgeInsets.all(widthSz * 0.005),
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
                    iconSize: widthSz * 0.015,
                    constraints: BoxConstraints(
                      minWidth: widthSz * 0.027,
                      minHeight: heightSz * 0.05,
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.greyColor,
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(edu["icon"]),
                  ),
                ),

                SizedBox(height: heightSz * 0.05),

                Text(
                  edu["institute"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontSize: widthSz * 0.014,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: heightSz * 0.01),

                Text(
                  edu["course"],
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontSize: widthSz * 0.010,
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                SizedBox(height: heightSz * 0.007),

                Text(
                  edu["year"],
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontSize: widthSz * 0.009,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF448AFF),
                  ),
                ),

                SizedBox(height: heightSz * 0.02),

                Text(
                  edu["orientation"],
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontSize: widthSz * 0.008,
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
      ),
    );
  }
}
