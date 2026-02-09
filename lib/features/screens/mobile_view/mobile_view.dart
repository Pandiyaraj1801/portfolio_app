import 'package:flutter/material.dart';
import 'package:portfolio/features/widgets/mobile_view/about_app.dart';
import 'package:portfolio/features/widgets/mobile_view/education_app.dart';
import 'package:portfolio/features/widgets/mobile_view/experience_app.dart';
import 'package:portfolio/features/widgets/mobile_view/projects_app.dart';
import 'package:portfolio/features/widgets/mobile_view/skills_app.dart';

class MoblieViewApp extends StatelessWidget {
  final ScrollController scrollController;
  final String selectedTxt;

  const MoblieViewApp({
    super.key,
    required this.scrollController,
    required this.selectedTxt,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedTxt.isEmpty || selectedTxt == "About")
            AboutApp()
          else if (selectedTxt == "Skills")
            SkillsApp()
          else if (selectedTxt == "Experience")
            ExperienceApp()
          else if (selectedTxt == "Education")
            EducationApp()
          else if (selectedTxt == "Projects")
            ProjectsApp(),
        ],
      ),
    );
  }
}
