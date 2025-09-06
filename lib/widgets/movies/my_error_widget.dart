import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    super.key,
    required this.errorText,
    required this.retryFuction,
  });
  final String errorText;
  final VoidCallback retryFuction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(MyAppIcons.error, size: 50, color: Colors.red),
          SizedBox(height: 10),
          Text(errorText, style: TextStyle(color: Colors.red, fontSize: 16)),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: retryFuction,
            child: Text("Retry", style: TextStyle(color: Colors.purple)),
          ),
        ],
      ),
    );
  }
}
