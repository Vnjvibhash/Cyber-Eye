import 'package:flutter/material.dart';
import 'package:cybereye/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // THEME UPDATE: Content updated to match the Cyber Eye app
  final List<IntroPage> _pages = [
    IntroPage(
      title: 'Tweet Analyzer',
      description:
          'Understand Twitter users through comprehensive tweet evaluation.',
      icon: '📊',
    ),
    IntroPage(
      title: 'Credit Scoring',
      description: 'Receive tailored credit scores for account authenticity.',
      icon: '💳',
    ),
    IntroPage(
      title: 'Safety Indicator',
      description:
          'Stay protected with instant risk assessments and account safety indicators.',
      icon: '🛡️',
    ),
    IntroPage(
      title: 'Your Privacy First',
      description:
          'No cloud. No tracking. Your data stays encrypted and offline — always.',
      icon: '🔐',
    ),
  ];

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // THEME UPDATE: Removed decorated Container. Scaffold now uses theme background.
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index]);
                },
              ),
            ),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(IntroPage page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              // THEME UPDATE: Using surface color with a subtle primary border
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: Center(
              child: Text(page.icon, style: const TextStyle(fontSize: 48)),
            ),
          ),
          const SizedBox(height: 48),
          Text(
            page.title,
            // THEME UPDATE: Text styles now fully inherit from the theme
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            page.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(
                context,
              ).textTheme.bodyLarge?.color?.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    bool isLastPage = _currentPage == _pages.length - 1;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  // THEME UPDATE: Indicator colors are from theme
                  color: _currentPage == index
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Show skip button only if not on the last page
              if (!isLastPage)
                TextButton(
                  onPressed: _navigateToLogin, // Navigation added
                  child: const Text('Skip'),
                )
              else
                // Empty container to keep the "Get Started" button on the right
                const SizedBox(width: 60),

              // THEME UPDATE: ElevatedButton styling is removed to use the global theme
              ElevatedButton(
                onPressed: () {
                  if (!isLastPage) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    _navigateToLogin(); // Navigation added
                  }
                },
                child: Text(isLastPage ? 'Get Started' : 'Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IntroPage {
  final String title;
  final String description;
  final String icon;

  IntroPage({
    required this.title,
    required this.description,
    required this.icon,
  });
}
