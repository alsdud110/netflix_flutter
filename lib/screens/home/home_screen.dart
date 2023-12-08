import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_flutter/screens/components/label_icon.dart';
import 'package:netflix_flutter/screens/components/play_button.dart';
import 'package:netflix_flutter/screens/components/small_sub_text.dart';
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
    ScrollController backController = ScrollController();
    ScrollController frontController = ScrollController();
    List<String> posters = [
      "assets/images/big_buck_bunny_poster.jpg",
      "assets/images/les_miserables_poster.jpg",
      "assets/images/minari_poster.jpg",
      "assets/images/the_book_of_fish_poster.jpg"
    ];
    Size appSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        SingleChildScrollView(
          controller: backController,
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage(posters[0]),
                    height: appSize.height * 0.6 +
                        (const SliverAppBar().toolbarHeight * 2),
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    height: appSize.height * 0.6 +
                        (const SliverAppBar().toolbarHeight * 2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.0),
                          Colors.black,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 0.5, 0.9],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: appSize.height),
            ],
          ),
        ),
        SafeArea(
          child: NotificationListener(
            onNotification: (ScrollNotification scrollInfo) {
              if (frontController.offset <= appSize.height) {
                backController.jumpTo(frontController.offset);
                return true;
              } else {
                return false;
              }
            },
            child: CustomScrollView(
              controller: frontController,
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
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
                        child: const Image(
                            image: AssetImage("assets/images/dog.jpg")),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SliverAppBar(
                  pinned: true, // AppBar가 하단 List 내렸을 때 바로 보여야 한다 -> true
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
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
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: _buildInfoBottomSheet,
                      );
                    },
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
                                TextSpan(text: "프로그램 · 로맨스"),
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
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBottomSheet(BuildContext context) {
    return Wrap(
      // 안의 내용만큼만 크기를 차지하도록 하려면 Wrap으로 감싸줘라 // Wrap 은 children이다
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF2B2B2B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: const Image(
                              image: AssetImage(
                                  "assets/images/big_buck_bunny_poster.jpg"),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 140,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "빅 벅 버니",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Row(
                                  children: [
                                    SmallSubText(text: "2008"),
                                    SizedBox(width: 10.0),
                                    SmallSubText(text: "15+"),
                                    SizedBox(width: 10.0),
                                    SmallSubText(text: "시즌 1개"),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Text("버니가 좋아하는 나비들 중 2마리가 죽고 "
                                    "버니 자신에게 공격이 오자 "
                                    "버니는 온순한 자연을 뒤로 하고 "
                                    "2마리의 나비로 인해 복수할 계획들을 치밀히 세운다.")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          PlayButton(
                            width: 155,
                          ),
                          Spacer(),
                          LabelIcon(
                            icon: FontAwesomeIcons.download,
                            label: "저장",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Spacer(),
                          LabelIcon(
                            icon: FontAwesomeIcons.playCircle,
                            label: "미리보기",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 8,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: const SizedBox(
                        height: 38,
                        child: Row(
                          children: [
                            Icon(Icons.info_outline_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "회차 및 상세정보",
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Icon(
                              FontAwesomeIcons.chevronRight,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 15,
              top: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFF525252),
                  ),
                  child: const Icon(FontAwesomeIcons.times),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
