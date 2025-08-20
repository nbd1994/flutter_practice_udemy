import 'package:flutter/material.dart';
import 'package:gamify_app/data.dart';
import 'package:gamify_app/widgets/scrollable_games_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _deviceHeight;
  var _deviceWidth;
  var _selectedGame;
  @override
  void initState() {
    super.initState();
    _selectedGame = 0;
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          _featuredGamesWidget(),
          _gradientBoxWidget(),
          _topLayerWidget(),
        ],
      ),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
      height: _deviceHeight * 0.5,
      width: _deviceWidth,

      child: PageView(
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            _selectedGame = index;
          });
        },
        children:
            featuredGames.map((fGame) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(fGame.coverImage.url),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 0.8 * _deviceHeight,
        width: _deviceWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(35, 45, 59, 1.0), Colors.transparent],
            stops: [0.65, 1.0],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _deviceWidth * 0.05,
        vertical: _deviceHeight * 0.005,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _topBarWidget(),
          SizedBox(height: _deviceHeight * 0.15),
          _featuredGamesInfoWidget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
            child: ScrollableGamesWidget(height: _deviceHeight * 0.24, width: _deviceWidth, showTitle: true, gameData: games),
          ),
          _featuredGameBannerWidget(),
          Padding(
            padding:EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
            child: ScrollableGamesWidget(height: _deviceHeight * 0.22, width: _deviceWidth, showTitle: false, gameData: games,),
          )
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return SizedBox(
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.menu, size: 30, color: Colors.white),

          Row(
            children: [
              Icon(Icons.search, size: 30, color: Colors.white),
              SizedBox(width: _deviceWidth * 0.03),
              Icon(Icons.notifications, size: 30, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featuredGamesInfoWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maxLines: 2,
          style: TextStyle(color: Colors.white, fontSize: _deviceHeight * 0.04),
          featuredGames[_selectedGame].title,
        ),
        SizedBox(height: _deviceHeight * 0.01,),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children:
              featuredGames.map((featuredGame) {
                var circleRadius = _deviceHeight * 0.005;
                var isActive =
                    featuredGame.title == featuredGames[_selectedGame].title;
                return Container(
                  margin: EdgeInsets.only(right: _deviceHeight * 0.01),
                  height: circleRadius * 2,
                  width: circleRadius * 2,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
  Widget _featuredGameBannerWidget(){
    return Container(
      height: _deviceHeight * 0.13,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(featuredGames[3].coverImage.url)),
        
      ),
    );
  }
}
