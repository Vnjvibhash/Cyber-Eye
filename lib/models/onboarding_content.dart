class OnboardingContent {
  final String title;
  final String description;
  final String icon;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final List<OnboardingContent> pages = [
  OnboardingContent(
    title: 'Tweet Analyzer',
    description:
        'Understand Twitter users through comprehensive tweet evaluation.',
    icon: '📊',
  ),
  OnboardingContent(
    title: 'Credit Scoring',
    description: 'Receive tailored credit scores for account authenticity.',
    icon: '💳',
  ),
  OnboardingContent(
    title: 'Safety Indicator',
    description:
        'Stay protected with instant risk assessments and account safety indicators.',
    icon: '🛡️',
  ),
  OnboardingContent(
    title: 'Your Privacy First',
    description:
        'No cloud. No tracking. Your data stays encrypted and offline — always.',
    icon: '🔐',
  ),
];
