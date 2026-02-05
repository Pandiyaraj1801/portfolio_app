// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/images/app_images.dart';
import 'package:portfolio/core/methods/app_methods/methods.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';

class InfiniteCarousel extends StatefulWidget {
  const InfiniteCarousel({super.key});

  @override
  State<InfiniteCarousel> createState() => _InfiniteCarouselState();
}

class _InfiniteCarouselState extends State<InfiniteCarousel> {
  late PageController _controller;
  final List<Map<String, dynamic>> skills = AppImage.skillSets;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.33, initialPage: 1000);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: AppResponsive.h(0.45),
        width: AppResponsive.space(330),
        child: PageView.builder(
          controller: _controller,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            int actualIndex = index % skills.length;

            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double scale = 1;

                if (_controller.position.haveDimensions) {
                  double pageOffset = _controller.page! - index;
                  scale = (1 - (pageOffset.abs() * 0.4)).clamp(0.6, 1.0);
                }

                return Center(
                  child: Transform.scale(scale: scale, child: child),
                );
              },
              child: SkillCard(skillCard: skills[actualIndex]),
            );
          },
        ),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final Map<String, dynamic> skillCard;

  const SkillCard({super.key, required this.skillCard});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
      onTap: () => AppMethods.openUrl(skillCard["url"]),
      child: SizedBox(
        width: AppResponsive.space(150),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // CARD BELOW
            Container(
              height: AppResponsive.space(110),
              width: double.infinity,
              padding: EdgeInsets.all(AppResponsive.space(7)),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.boxBorderColor.withOpacity(0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.boxShadowColor,
                    blurRadius: 0.8,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    skillCard["title"],
                    style: theme.textTheme.bodyLarge?.copyWith(
                      letterSpacing: 1,
                      fontSize: AppResponsive.font(10),
                    ),
                  ),
                  SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      skillCard["subtitle"],
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: AppResponsive.font(5.5),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "View More",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: AppResponsive.font(6),
                        color: isDark
                            ? AppColors.greyColor.withOpacity(0.5)
                            : AppColors.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // IMAGE FLOATING ABOVE
            Positioned(
              top: AppResponsive.space(-30),
              left: 0,
              right: 0,
              child: SizedBox(
                height: AppResponsive.space(70),
                child: Image.asset(skillCard["image"], fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
