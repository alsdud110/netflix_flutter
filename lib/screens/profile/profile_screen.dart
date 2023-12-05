import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_flutter/constants.dart';
import 'package:netflix_flutter/screens/profile/components/add_card.dart';
import 'package:netflix_flutter/screens/profile/components/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/Profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Netflix Play",
          style: kTitleTextStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.pen,
              size: 18,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Netflix Play를 시청할 프로필을 선택하세요.",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Wrap(
                spacing: 25,
                children: [
                  ProfileCard(),
                  AddCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
