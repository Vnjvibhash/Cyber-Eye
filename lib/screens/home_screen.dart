import 'package:flutter/material.dart';
import 'package:cybereye/widgets/credit_score_chart.dart';
import 'package:cybereye/widgets/home_header_clipper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF3A3A3A).withAlpha(20),
      body: Stack(
        children: [
          // The blue header with its custom shape
          ClipPath(
            clipper: HomeHeaderClipper(),
            child: Container(
              height: size.height * 0.3,
              color: theme.primaryColor,
            ),
          ),

          // The main content of the page
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Header Row ---
                  _buildHeader(),
                  const SizedBox(height: 20),
                  Text(
                    'Hey, Good morning,\nVivekaJee',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- Credit Score Card ---
                  _buildCreditScoreCard(theme),
                  const SizedBox(height: 20),

                  // --- Bottom Decorative Card ---
                  _buildBottomCard(theme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.menu, color: Colors.white, size: 30),
        Stack(
          children: [
            const CircleAvatar(
              radius: 25,
              // You can use a real image here
              backgroundImage: NetworkImage('https://res.cloudinary.com/datxdx0wi/image/upload/v1750217121/pjlbiwax6pwd1obiiwpt.jpg'),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.greenAccent,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCreditScoreCard(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your current credit score',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '97.94%',
            style: theme.textTheme.displaySmall?.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // The bar chart
          const SizedBox(height: 100, child: CreditScoreChart()),
        ],
      ),
    );
  }

  Widget _buildBottomCard(ThemeData theme) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.secondary.withOpacity(0.8),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned(
              right: -50,
              top: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.colorScheme.secondary.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
