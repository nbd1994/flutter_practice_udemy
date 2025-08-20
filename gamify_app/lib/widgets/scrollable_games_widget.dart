import 'package:flutter/material.dart';
import 'package:gamify_app/data.dart';

class ScrollableGamesWidget extends StatelessWidget {

  final double width;
  final double height;
  final List<Game> gameData;
  final bool showTitle;
const ScrollableGamesWidget({super.key, required this.height, required this.width, required this.showTitle, required this.gameData});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: width,
      height: height,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: gameData.map((_game){
          return Container(
            padding: EdgeInsets.only(right: width*0.03),
            width: width*0.3,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: showTitle ?  height*0.75 : height,
                  width: width*0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image:DecorationImage(
                      fit: BoxFit.cover,
                      image:NetworkImage(_game.coverImage.url))
                  ),
                ),
                showTitle ? Text(_game.title, maxLines: 2, style: TextStyle(fontSize: height*0.08, color: Colors.white),) : SizedBox()
              ],
            ),
          );}
        ).toList(),
      ),
    );
  }
}