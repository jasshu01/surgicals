import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade800,
            Colors.blue.shade400,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Centering the logo
        children: [
          // Logo as a landscape image
          Container(
            width: 200, // Adjust width for landscape logo
            height: 100, // Adjust height accordingly
            decoration: BoxDecoration(
              color: Colors.white, // Keeps the white background intact
              borderRadius: BorderRadius.circular(
                  8.0), // Optional: slight rounding for a cleaner look
              border: Border.all(
                  color: Colors.blue.shade800,
                  width: 2.0), // Optional: border for contrast
            ),
            child: Image.asset(
              'assets/images/logo.png', // Path to your logo
              fit: BoxFit.contain, // Ensures the logo fits without distortion
            ),
          ),
          SizedBox(height: 16.0), // Spacing between logo and title
          // Removed the "Ashirvaad Surgical" text since it's already in the logo
          Text(
            'Quality Medical Equipment',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 16.0), // Spacing before description
          // Added the provided text
          Text(
            'At Ashirvaad Surgical, we are dedicated to providing healthcare professionals '
            'with high-quality, reliable surgical equipment, both brand-new and expertly refurbished. '
            'Partnering with world-renowned brands like Stryker, Karl Storz, Olympus, and Smith & Nephew, '
            'we ensure that our products meet the highest standards of performance and safety. '
            'Whether you\'re looking to equip your medical practice with the latest technology or '
            'seeking affordable, certified refurbished equipment, we are here to support your needs with '
            'trust, expertise, and personalized service. Explore our range and discover the Ashirvaad Surgical difference.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5, // Line height for better readability
            ),
          ),
        ],
      ),
    );
  }
}
