class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

// Ensure you have these image assets in your project
final List<OnboardingContent> pages = [
  OnboardingContent(
    image: 'assets/images/onboarding1.png',
    title: 'Tweet Analyzer',
    description:
        "Understand Twitter users through comprehensive tweet evaluation.",
  ),
  OnboardingContent(
    image: 'assets/images/onboarding2.png',
    title: 'Credit Scoring',
    description: "Receive tailored credit scores for account authenticity.",
  ),
  OnboardingContent(
    image: 'assets/images/onboarding3.png',
    title: 'Safety Indicator',
    description:
        "Stay protected with instant risk assessments and account safety indicators.",
  ),
];
