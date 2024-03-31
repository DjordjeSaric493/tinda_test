// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'dart:developer'; //usable for dev logz

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController(
    initialPage: 0,
  );

  int numberOfUserPhotos = 3;
  int currentUserPhoto = 0;
  late MatchEngine _matchEngine;

  List<SwipeItem> itemz = [
    //3 swipe items
    SwipeItem(
        content: "Yolo",
        likeAction: () {
          log("like");
        },
        nopeAction: () {
          log("Ne ko kuća");
        },
        onSlideUpdate: (SlideRegion? region) async {
          log("Region $region");
        }),
    SwipeItem(
        content: "Yolo",
        likeAction: () {
          log("like");
        },
        nopeAction: () {
          log("Ne ko kuća");
        },
        onSlideUpdate: (SlideRegion? region) async {
          log("Region $region");
        }),
    SwipeItem(
        content: "Yolo",
        likeAction: () {
          log("like");
        },
        nopeAction: () {
          log("Ne ko kuća");
        },
        onSlideUpdate: (SlideRegion? region) async {
          log("Region $region");
        })
  ];

  @override
  void initState() {
    _matchEngine = MatchEngine(swipeItems: itemz);
    super.initState();
  }

  //dispose when i close app
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SwipeCards(
        matchEngine: _matchEngine,
        upSwipeAllowed: true,
        onStackFinished: () {},
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(3, 0, 3, 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Hero(
                tag: "imageTag$index",
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/user_images/img1.png")),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [Colors.black, Colors.transparent],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (currentUserPhoto != 0) {
                                setState(() {
                                  currentUserPhoto = currentUserPhoto - 1;
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (currentUserPhoto < (numberOfUserPhotos - 1)) {
                                setState(() {
                                  currentUserPhoto = currentUserPhoto + 1;
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //top indicator->should show 3 lines if i didn't f up
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6.2),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 15,
                          height: 5,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: numberOfUserPhotos,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.2),
                                //container of lines
                                child: Container(
                                  //calculate the width based on padding size
                                  //found formula on net and ajdusted a bit, im not smart enough
                                  width: ((MediaQuery.of(context).size.width -
                                          (15 +
                                              ((numberOfUserPhotos + 1) *
                                                  8.4))) /
                                      numberOfUserPhotos),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.white, width: 0.4),
                                    //conditionally set the color of an item
                                    //based on whether currentUserPhoto is equal to index
                                    color: currentUserPhoto == index
                                        ? Colors
                                            .white //if it's tru set to white
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.5), //otherwise
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    //create Padding for stuff on user's photos
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      itemz[index].content,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "26",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 28),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(0.1),
                                        child: Image.asset(
                                          'assets/iconz/blue-checkmark.png',
                                          //color: Colors.blue,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                    )
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.info,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //red x
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    onTap: () {
                                      _matchEngine.currentItem!.like();
                                    },
                                    splashColor: Colors.red,
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(0.1),
                                        child: Image.asset(
                                          'assets/iconz/close-x.png',
                                          color: Colors.red,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                    )),
                              ),

                              //green <sqrt(9);
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    onTap: () {
                                      _matchEngine.currentItem!.like();
                                    },
                                    splashColor: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(0.1),
                                        child: Image.asset(
                                          'assets/iconz/green_heart.png',
                                          color: Colors.greenAccent,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
