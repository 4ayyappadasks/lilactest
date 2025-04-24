import 'package:flutter/material.dart';
import '../text/textdata.dart';

class CustomButtonwithgrad extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double borderRadius;
  final List<Color> gradientColors;
  final Color? textcolor;
  final FontWeight? textweight;
  final double? textsize;
  final Alignment? gradalingend;
  final Alignment? gradalingbegin;


  const CustomButtonwithgrad({
    Key? key,
    required this.text,
    required this.onTap,
    this.width = 200,
    this.height = 50,
    this.borderRadius = 10,
    required this.gradientColors,
    this.textcolor,
    this.textsize,
    this.textweight,
    this.gradalingend,
    this.gradalingbegin,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            begin: gradalingbegin??Alignment.topCenter,
            end: gradalingend??Alignment.bottomCenter,
            colors: gradientColors,
          ),
        ),
        child: Center(
          child: Textwithfont(
            text: text,
            color: textcolor,
            fontWeight: textweight,
            fontSize: textsize??12.00,

          ),
        ),
      ),
    );
  }
}