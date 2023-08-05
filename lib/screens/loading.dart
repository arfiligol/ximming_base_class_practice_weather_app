import 'package:flutter/material.dart';

/// Represents the loading screen of the application.
///
/// This screen displays a centered cloud icon and a circular progress indicator.
class LoadingScreen extends StatelessWidget {
  /// Creates a loading screen.
  ///
  /// [key] is an optional parameter used for controlling the framework's widget
  /// tree. It is passed to the superclass.
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.cloud,
              size: 100.0, // Adjust the size of the icon as needed
              color: Colors.grey, // Adjust the color of the icon as needed
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(), // Display a circular progress indicator
          ],
        ),
      ),
    );
  }
}
