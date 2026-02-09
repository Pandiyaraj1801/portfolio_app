import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constant/education_projects/userinfo.dart';
import 'package:portfolio/core/constant/url_configs/urls.dart';
import 'package:portfolio/core/methods/app_methods/methods.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';

class InfoDetails extends StatelessWidget {
  const InfoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Row(
      children: [
        personalDtls(PersonalDetails.mobileNo, Icons.phone, theme),

        personalDtls(PersonalDetails.emailAccount, Icons.mail_outline, theme),

        personalDtls(
          "${PersonalDetails.location} - ${PersonalDetails.pinno}",
          Icons.location_on_outlined,
          theme,
        ),

        Expanded(child: SizedBox()),

        socialContact(FontAwesomeIcons.linkedin, AppUrls.linkedInUrl, 18),

        socialContact(FontAwesomeIcons.github, AppUrls.gitHubUrl, 18),

        socialContact(Icons.mail_outline, AppUrls.emailUrl, 20),

        socialContact(FontAwesomeIcons.dev, AppUrls.dailyDevUrl, 18),

        socialContact(FontAwesomeIcons.medium, AppUrls.mediumUrl, 18),
      ],
    );
  }
}

Widget personalDtls(String txt, IconData icon, ThemeData theme) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: AppResponsive.space(5)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: AppResponsive.icon(12)),

        Text(
          " $txt",
          style: theme.textTheme.displayMedium?.copyWith(
            fontSize: AppResponsive.font(8),
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}

Widget socialContact(dynamic icon, String url, double iconSize) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: AppResponsive.space(2)),
    child: IconButton(
      icon: Icon(icon, size: AppResponsive.font(iconSize)),
      onPressed: () => AppMethods.openUrl(url),
    ),
  );
}
