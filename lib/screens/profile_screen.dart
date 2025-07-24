import 'package:cybereye/widgets/custom_button.dart';
import 'package:cybereye/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:cybereye/widgets/profile_header_painter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF3A3A3A).withAlpha(20),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(size.width, size.height * 0.5),
              painter: ProfileHeaderPainter(theme),
            ),
          ),

          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    // Back Button
                    const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    const SizedBox(height: 20),

                    // Profile Picture
                    Center(child: _buildProfilePicture()),
                    const SizedBox(height: 40),

                    // Form Fields
                    CustomInputField(label: 'Username', value: 'Vivekajee'),
                    CustomInputField(label: 'First name', value: 'Vivek'),
                    CustomInputField(label: 'Last name', value: 'Jee'),
                    CustomInputField(
                      label: 'Date of Birth',
                      value: '10-01-2002',
                      showCheckIcon: false,
                    ),
                    const SizedBox(height: 40),

                    CustomGradientButton(
                      text: 'Complete',
                      onPressed: ()=>{},
                      icon: Icons.arrow_forward,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Container(
      width: 120,
      height: 120,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0F7),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(27),
        child: Image.network(
          'https://res.cloudinary.com/datxdx0wi/image/upload/v1750217121/pjlbiwax6pwd1obiiwpt.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
