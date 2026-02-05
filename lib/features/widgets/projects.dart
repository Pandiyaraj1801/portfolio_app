// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/education_projects/project_details.dart';
import 'package:portfolio/core/constant/images/images.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 220, // card width + margin
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 220,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: AppResponsive.space(225),
          width: AppResponsive.space(900),
          padding: EdgeInsets.symmetric(horizontal: AppResponsive.space(20)),
          child: ListView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: ProjectDetails.projectCards.map((item) {
              return Container(
                height: AppResponsive.space(200),
                width: AppResponsive.space(200),
                margin: EdgeInsets.symmetric(
                  horizontal: AppResponsive.space(12),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.logoColor.withOpacity(0.13),
                ),
                child: Stack(
                  children: [
                    /// 🔹 Background Image (NO padding)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        ImagePath.projectsImg, // your image
                        height: AppResponsive.space(120),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// 🔹 Overlay Icon (Top Right)
                    Positioned(
                      top: AppResponsive.space(6),
                      right: AppResponsive.space(6),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greyColor,
                        ),
                        child: IconButton(
                          iconSize: AppResponsive.font(15),
                          constraints: BoxConstraints(
                            minWidth: AppResponsive.space(30),
                            minHeight: AppResponsive.space(30),
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.cloud),
                        ),
                      ),
                    ),

                    /// 🔹 Content below image
                    Positioned(
                      top: AppResponsive.space(120),
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.all(AppResponsive.space(7)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.displayMedium?.copyWith(
                                fontSize: AppResponsive.font(9),
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: AppResponsive.space(3)),

                            Text(
                              item.content,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: theme.textTheme.displayMedium?.copyWith(
                                fontSize: AppResponsive.font(5.5),
                                letterSpacing: 1,
                                fontWeight: FontWeight.w100,
                                height: 1.5,
                              ),
                            ),

                            SizedBox(height: AppResponsive.space(10)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: item.tech.map((val) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: AppResponsive.space(2),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppResponsive.space(3),
                                    horizontal: AppResponsive.space(6),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Text(
                                    val,
                                    style: theme.textTheme.displayMedium
                                        ?.copyWith(
                                          fontSize: AppResponsive.font(5.5),
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w100,
                                          height: 1.5,
                                        ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),

        /// LEFT BUTTON
        Positioned(
          left: 0,
          child: IconButton(
            onPressed: scrollLeft,
            icon: Icon(Icons.chevron_left, size: 30),
          ),
        ),

        /// RIGHT BUTTON
        Positioned(
          right: -10,
          child: IconButton(
            onPressed: scrollRight,
            icon: Icon(Icons.chevron_right, size: 30),
          ),
        ),
      ],
    );
  }
}
