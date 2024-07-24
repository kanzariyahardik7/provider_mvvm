import 'package:flutter/material.dart';
import 'package:provider_test/universal_widget/myimage.dart';
import 'package:provider_test/utils/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration:
          BoxDecoration(color: blue, borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: const MyImage(
          height: 150,
          width: 150,
          imagePath: "flutterImage.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
