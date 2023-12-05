import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Column(
        children: [
          SizedBox(
            width: 90,
            height: 90,
            child: Icon(
              Icons.add_circle,
              size: 50,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "프로필 추가",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
