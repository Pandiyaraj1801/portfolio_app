// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/images/app_images.dart';
import 'package:portfolio/core/methods/app_methods/methods.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';
import 'package:portfolio/core/widgets/header_txt.dart';

class SkillsApp extends StatelessWidget {
  final List<Map<String, dynamic>> skills = AppImage.skillSets;

  SkillsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppResponsive.space(20)),

        TxtHeader(txt: "Skills", fontSize: 23),

        SizedBox(
          height: 500,
          child: GridView.builder(
            padding: const EdgeInsets.all(14),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              final item = skills[index];

              return Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppResponsive.space(100),
                      child: Image.asset(item["image"], fit: BoxFit.cover),
                    ),
                    // const SizedBox(height: 5),
                    Text(
                      item["title"],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    // const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(right: AppResponsive.space(7)),
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.greyColor,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () => AppMethods.openUrl(item["url"]),
                          child: Icon(
                            Icons.navigate_next,
                            size: AppResponsive.space(15),
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
