import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  
  final double width;
  final double height;
  
  const ShimmerWidget({
  
    Key? key, 
    required this.width, 
    required this.height
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
      ),
    );
  }
}