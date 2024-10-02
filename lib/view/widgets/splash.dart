  import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Wrap the image in Expanded so it takes the available space
            Expanded(
              child: Image(
                image: AssetImage("lib/assets/images/Live News.jpg"),
                fit: BoxFit.cover, // Ensures the image covers the screen properly
                width: double.infinity, // Take up the full width of the screen
              ),
            ),
            SizedBox(height: 20), // Spacer to separate image and text
            Text(
              "Developed By\nCODE WITH ANKIT",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
