import 'package:cybereye/widgets/custom_button.dart';
import 'package:cybereye/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:cybereye/widgets/profile_header_painter.dart';

class ProfileScreen extends StatelessWidget {
    final GlobalKey<ScaffoldState> scaffoldKey;
  const ProfileScreen({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
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
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    const SizedBox(height: 20),

                    Center(child: _buildProfilePicture()),
                    const SizedBox(height: 40),

                    CustomInputField(label: 'Username', value: 'Vivekajee'),
                    CustomInputField(label: 'First name', value: 'Vivek'),
                    CustomInputField(label: 'Last name', value: 'Jee'),
                    CustomInputField(
                      label: 'Date of Birth',
                      value: '06-12-1996',
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
