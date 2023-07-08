import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarouseLoading extends StatelessWidget {
  const CarouseLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
                ),
              ),
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey
                ),
              ),
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey
                ),
              ),
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey
                ),
              ),
            ],
          )

        ],

      ),);
  }
}
