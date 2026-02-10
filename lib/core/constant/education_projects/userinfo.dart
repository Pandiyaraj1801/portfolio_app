import 'package:flutter/material.dart';

class DashboardItem {
  final String title;
  final IconData icon;
  final GlobalKey key;

  DashboardItem({required this.title, required this.icon, required this.key});
}

class PersonalDetails {
  static const username = "Pandiyaraj";
  static const emailAccount = "pandiyaraj1801@gmail.com";
  static const mobileNo = "+91 6385220204";
  static const location = "Madurai";
  static const pinno = "625011";
}

class InstituteDetails {
  static const List<Map<String, dynamic>> educations = [
    {
      "icon": Icons.code,
      "institute": "QSPIDERS",
      "course": "Java Full Stack Developer",
      "year": "Dec 2022 - Jun 2023",
      "orientation":
          "Comprehensive training in Java full-stack development, covering both frontend and backend technologies, database management, and modern development practices.",
    },

    {
      "icon": Icons.school,
      "institute": "The Madura College",
      "course": "B.com (Banking and Insurance)",
      "year": "Jun 2019 - Jun 2022",
      "orientation":
          "Bachelor’s degree in Banking and Insurance with a focus on banking operations, financial management, insurance principles, risk management, and regulatory frameworks.",
    },

    {
      "icon": Icons.auto_stories,
      "institute": "St.John's Matriculation School",
      "course": "Higher Secondary Education",
      "year": "Jun 2019 - Jun 2022",
      "orientation":
          "Completed Higher Secondary Education with specialization in Accountancy and Business Mathematics, covering financial accounting principles, business calculations, and analytical problem-solving.",
    },
  ];
}
