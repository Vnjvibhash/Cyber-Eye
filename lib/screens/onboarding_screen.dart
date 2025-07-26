import 'package:cybereye/models/onboarding_content.dart';
import 'package:cybereye/screens/login_screen.dart';
import 'package:cybereye/widgets/onboarding_clipper.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.08, bottom: 20.0),
            child: Image.asset('assets/images/logo.png', width: 60),
          ),

          Expanded(
            flex: 2,
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Image.asset(pages[i].image),
                );
              },
            ),
          ),

          Expanded(
            flex: 2,
            child: ClipPath(
              clipper: OnboardingClipper(),
              child: Container(
                width: size.width,
                color: const Color(0xFFF7F7FA),
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      pages[_currentPage].title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF3F3D56),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      pages[_currentPage].description,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF8A8A8E),
                      ),
                    ),
                    const Spacer(),
                    _buildBottomControls(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: List.generate(
            pages.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 6,
              width: _currentPage == index ? 20 : 6,
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _currentPage == index
                    ? const Color(0xFF3F3D56)
                    : const Color(0xFFD8D8D8),
              ),
            ),
          ),
        ),
        _buildNextButton(),
      ],
    );
  }

  Widget _buildNextButton() {
    bool isLastPage = _currentPage == pages.length - 1;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        if (isLastPage) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isLastPage ? "Get Started" : "Next",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            if (!isLastPage) const SizedBox(width: 8),
            if (!isLastPage)
              const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
