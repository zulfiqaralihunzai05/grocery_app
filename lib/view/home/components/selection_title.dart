import 'package:flutter/material.dart';

class SelectionTitle extends StatelessWidget {
  final String title;
  const SelectionTitle({Key? key,
  required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "see more",
            style: TextStyle(
              color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}
