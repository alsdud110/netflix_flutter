import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_flutter/screens/components/label_icon.dart';
import 'package:netflix_flutter/screens/components/play_button.dart';
import 'package:netflix_flutter/screens/home/components/poster.dart';
import 'package:netflix_flutter/screens/home/components/rank_poster.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> posters = [
      "assets/images/big_buck_bunny_poster.jpg",
      "assets/images/les_miserables_poster.jpg",
      "assets/images/minari_poster.jpg",
      "assets/images/the_book_of_fish_poster.jpg"
    ];
    Size appSize = MediaQuery.of(context).size;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const Center(
              child: Text(
                "M",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(FontAwesomeIcons.chromecast),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.search),
                onPressed: () {},
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child:
                      const Image(image: AssetImage("assets/images/dog.jpg")),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SliverAppBar(
            pinned: true, // AppBar가 하단 List 내렸을 때 바로 보여야 한다 -> true
            centerTitle: true,
            automaticallyImplyLeading: false,
            //하단 List를 최상단으로 올렸을때의 SliverAppBar의 Default height
            //expandedHeight를 사용하면 스크롤을 내리면 toolbarheight높이까지 줄어든다.
            // expandedHeight: 100.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("TV 프로그램"),
                Text("영화"),
                Text("내가 찜한 콘텐츠"),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: (appSize.height * 0.6),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "오늘 한국에서 콘텐스 순위 1위",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LabelIcon(icon: Icons.add, label: "내가 찜한 콘텐츠"),
                      PlayButton(
                        width: 80,
                      ),
                      LabelIcon(
                        icon: Icons.info_outline,
                        label: "정보",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 40, left: 10),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: "오늘 한국의 ",
                          children: [
                            TextSpan(
                              text: "TOP 10",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: " 콘텐스"),
                          ],
                          style: TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          posters.length,
                          (index) => SizedBox(
                            width: 150,
                            height: 200,
                            child: RankPoster(
                              rank: (index + 1).toString(),
                              posterUrl: posters[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 40, left: 10),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "TV ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: "프로그램 - 로맨스"),
                        ],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          posters.length,
                          (index) => Poster(
                            posterUrl: posters[index],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
