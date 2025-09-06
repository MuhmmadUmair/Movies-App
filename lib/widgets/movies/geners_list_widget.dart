import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_constants.dart';

class GenersListWidget extends StatelessWidget {
  const GenersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        MyAppConstants.genres.length,
        (index) => chipWidget(
          genreName: MyAppConstants.genres[index],
          context: context,
        ),
      ),
    );
  }
}

Widget chipWidget({required String genreName, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    child: Container(
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).colorScheme.surface),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
        child: Text(genreName, style: TextStyle(fontSize: 14)),
      ),
    ),
  );
}
