import 'package:portfolio/core/constant/images/images.dart';
import 'package:portfolio/core/constant/urls/urls.dart';

class AppImage {
  static final String developerLogo = ImagePath.developerLogoImg;

  static final String dashboardImg = ImagePath.dashboardDevImg3;

  static final String flattradeImg = ImagePath.flattrade;

  static final String flattradeBannerImg = ImagePath.flattradeBanner;

  static final List<Map<String, dynamic>> skillSets = [
    {
      'title': 'HTML',
      'subtitle': 'Semantic markup & accessible layouts',
      'image': ImagePath.htmlImg,
      'url': AppUrls.htmlDocsUrl,
    },
    {
      'title': 'CSS',
      'subtitle': 'Responsive design & modern styling',
      'image': ImagePath.cssImg,
      'url': AppUrls.cssDocsUrl,
    },
    {
      'title': 'JavaScript',
      'subtitle': 'ES6+, async logic & DOM handling',
      'image': ImagePath.javascriptImg,
      'url': AppUrls.javascriptDocsUrl,
    },
    {
      'title': 'Flutter',
      'subtitle': 'Cross-platform mobile app development',
      'image': ImagePath.flutterImg,
      'url': AppUrls.flutterDocsUrl,
    },
    {
      'title': 'Golang',
      'subtitle': 'High-performance backend services',
      'image': ImagePath.golangImg,
      'url': AppUrls.golangDocsUrl,
    },
    {
      'title': 'Vue.js',
      'subtitle': 'Reactive UI & component-based apps',
      'image': ImagePath.vuejsImg,
      'url': AppUrls.vuejsDocsUrl,
    },
    {
      'title': 'Postman',
      'subtitle': 'API testing & request automation',
      'image': ImagePath.postmanImg,
      'url': AppUrls.postmanDocsUrl,
    },
    {
      'title': 'GitHub',
      'subtitle': 'Version control & team collaboration',
      'image': ImagePath.githubImg,
      'url': AppUrls.githubDocsUrl,
    },
    {
      'title': 'Firebase',
      'subtitle': 'Auth, realtime data & cloud services',
      'image': ImagePath.firebaseImg,
      'url': AppUrls.firebaseDocsUrl,
    },
    {
      'title': 'MySQL',
      'subtitle': 'Relational database design & queries',
      'image': ImagePath.mysqlImg,
      'url': AppUrls.mysqlDocsUrl,
    },
    {
      'title': 'MariaDB',
      'subtitle': 'Scalable SQL database management',
      'image': ImagePath.mariadbImg,
      'url': AppUrls.mariadbDocsUrl,
    },
    {
      'title': 'DBeaver',
      'subtitle': 'Database management & query tooling',
      'image': ImagePath.dbeaverImg,
      'url': AppUrls.dbeaverDocsUrl,
    },
  ];
}
