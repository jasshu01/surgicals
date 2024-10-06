import 'package:flutter/material.dart';

class ImageDisplaySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Our Featured Products',
          style: TextStyle(
            fontSize: 24, // Adjusted size for visibility
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/stryker-1188-camera-head.webp", // Example image
                height: 200, // You can adjust the height as needed
                fit: BoxFit
                    .cover, // Ensures the image covers the allocated space
              ),
              SizedBox(height: 16),
              Text(
                'Stryker 1188 Camera Head',
                style: TextStyle(
                  fontSize: 20, // Adjusted size for visibility
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'This camera head is a high-definition imaging device designed for advanced surgical applications.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14, // Adjusted size for visibility
                  color: Colors.grey[600], // Optional: grey color for text
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
