import 'package:flutter/material.dart';
import 'package:provider_test/universal_widget/mytext.dart';
import 'package:provider_test/utils/colors.dart';

class FullButton extends StatefulWidget {
  final VoidCallback ontap;
  final String title;
  const FullButton({super.key, required this.ontap, required this.title});

  @override
  State<FullButton> createState() => FullButtonState();
}

class FullButtonState extends State<FullButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: widget.ontap,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.065,
        width: MediaQuery.sizeOf(context).width * 0.9,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), color: blue),
        child: Center(
          child: MyText(
            text: widget.title,
            color: white0,
            fontsize: 18,
            fontweight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
