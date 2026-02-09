class ProjectCard {
  final String title;
  final String content;
  final List<String> tech;

  const ProjectCard({
    required this.title,
    required this.content,
    required this.tech,
  });
}

class ProjectDetails {
  static List<ProjectCard> projectCards = [
    ProjectCard(
      title: "Emerge Trading App",
      content:
          "Developed a real-time trading application with WebSocket for live LTP updates. - Implemented basket order placement, tradebook, and advanced state handling with Provider/BLOC.",
      tech: ["Flutter", "Golang", "VueJs"],
    ),

    ProjectCard(
      title: "Visitor Tracking App",
      content:
          "Created a seamless visitor check-in system using QR code scans. - Visitors fill out details in a Flutter-powered form upon scan, maintaining precise logs.",
      tech: ["Flutter", "Golang", "VueJs"],
    ),

    ProjectCard(
      title: "Spark App",
      content:
          "Built employee/KRA registration modules and Al tool onboarding workflows. - Developed a three-level approval system for email and Telegram notifications",
      tech: ["Flutter", "Golang"],
    ),

    ProjectCard(
      title: "Middleware Monitor Admin App",
      content:
          "Monitored four services with real-time WebSocket and API fallback. - Managed active subscriber sessions and tracked business logic errors in a responsive dashboard.",
      tech: ["Flutter", "Golang", "VueJs"],
    ),

    ProjectCard(
      title: "Oauth System App",
      content:
          '''Designed and implemented a secure OAuth-based access system for trading applications, enabling 
users to register static IPs and app names to request API keys through an approval workflow. - Integrated dual-application architecture with company-side approval via Spark and automated API 
key issuance, including email notifications for both request and approval stages.''',
      tech: ["Golang", "VueJs"],
    ),
  ];
}
