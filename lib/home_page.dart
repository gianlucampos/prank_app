import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final audioPlayer = AudioPlayer();
  final urlAudio = 'https://www.youtube.com/watch?v=b9GilKnpiv0';
  final michaelGif =
      'https://media.tenor.com/FOkn--1uI2MAAAAM/funny-dance-crazy-dance.gif';
  final dwightGif =
      'https://media.tenor.com/6pzg03m6ze0AAAAC/the-office-dwight-schrute.gif';
  final jimGif = 'https://media.tenor.com/TLTaH57NajIAAAAM/the-office.gif';
  final pamGif = 'https://media4.giphy.com/media/D8xNev92dfqdG9FPx4/giphy.gif';
  final erinGif = 'https://media.tenor.com/jiSc1j21XRYAAAAC/hell-yeah-yeah.gif';
  final creedGif = 'https://media.giphy.com/media/YVDVn0eIWHiLe/giphy.gif';

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(milliseconds: 100),
      (_) {
        super.setState(() {});
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await audioPlayer.setSource(AssetSource('audio/theOffice.mp3'));
      await audioPlayer.resume();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.9;
    var width = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
        body: Stack(
      children: [
        buildPositioned(height: height, width: width, link: michaelGif),
        buildPositioned(height: height, width: width, link: dwightGif),
        buildPositioned(height: height, width: width, link: jimGif),
        buildPositioned(height: height, width: width, link: pamGif),
        buildPositioned(height: height, width: width, link: erinGif),
        buildPositioned(height: height, width: width, link: creedGif),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              setState(() {});
            },
            child: const Text('Clique Aqui'),
          ),
        )
      ],
    ));
  }

  Positioned buildPositioned(
      {required double height, required double width, required String link}) {
    return Positioned(
      top: Random().nextInt(height.toInt()).toDouble(),
      left: Random().nextInt(width.toInt()).toDouble(),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(link),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
