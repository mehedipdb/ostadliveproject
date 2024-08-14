import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Text Styling',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextStylingScreen(),
    );
  }
}

class TextStylingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Styling App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title Text
            Text(
              'Flutter Text Styling',
              style: TextStyle(
                fontSize: 24.0, // Larger text
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
            SizedBox(height: 10), // Spacing between title and subtitle
            // Subtitle Text
            Text(
              'Experiment with text styles',
              style: TextStyle(
                fontSize: 18.0, // Smaller text
                fontStyle: FontStyle.italic, // Italic text
              ),
            ),
            SizedBox(height: 20), // Spacing between subtitle and button
            // TextButton
            TextButton(
              onPressed: () {
                // Display a Snackbar when the button is pressed
                final snackBar = SnackBar(
                  content: Text('You clicked the button!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Click Me'),
            ),
            SizedBox(height: 20),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to ',
                  style: TextStyle(
                    fontSize: 18.0, // Smaller text
                    fontStyle: FontStyle.italic, // Italic text
                  ),
                ),
                Text(
                  'Flutter!',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0, // Smaller text
                    fontStyle: FontStyle.italic, // Italic text
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
