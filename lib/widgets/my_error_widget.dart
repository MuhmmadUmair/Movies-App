import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    super.key,
    required this.errorText,
    required this.retryFunction,
  });
  final String errorText;
  final VoidCallback retryFunction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(MyAppIcons.error, size: 50, color: Colors.red),
            SizedBox(height: 10),
            Text(errorText, style: TextStyle(color: Colors.red, fontSize: 16)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: retryFunction,
              child: Text("Retry", style: TextStyle(color: Colors.purple)),
            ),
          ],
        ),
      ),
    );
  }
}
