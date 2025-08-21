import 'package:authify_app/utils/animations/login_page_animations.dart';
import 'package:flutter/material.dart';

class AnimatedLoginPage extends StatefulWidget {
  @override
  _AnimatedLoginPageState createState() => _AnimatedLoginPageState();
}

class _AnimatedLoginPageState extends State<AnimatedLoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      reverseDuration: Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage(animationController: _animationController);
  }
}

class LoginPage extends StatelessWidget {
  AnimationController animationController;
  late EnterAnimation enterAnimation;
  LoginPage({super.key, required this.animationController}) {
    enterAnimation = EnterAnimation(animationController);
    animationController.forward();
  }

  late double _deviceHeight;
  late double _deviceWidth;

  @override
  Color _primaryColor = Color.fromRGBO(125, 191, 211, 1.0);
  Color _secondaryColor = Color.fromRGBO(169, 224, 241, 1.0);
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _primaryColor,
      body: Center(
        child: Container(
          height: _deviceHeight * 0.60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(alignment: Alignment.center, child: _avatarWidget()),
              SizedBox(height: _deviceHeight * 0.05),
              _emailTextFieldWidget(),
              _passwordFieldWidget(),
              SizedBox(height: _deviceHeight * 0.10),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    var rad = _deviceHeight * 0.1;
    return AnimatedBuilder(
      animation: enterAnimation.cntrlr,
      builder: (BuildContext context, Widget? child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(enterAnimation.circleSize.value, enterAnimation.circleSize.value, 1),
          child: CircleAvatar(
            radius: rad,
            backgroundColor: _secondaryColor,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        );
      },
    );
  }

  Widget _emailTextFieldWidget() {
    return SizedBox(
      width: _deviceWidth * 0.70,
      child: TextField(
        autocorrect: false,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),

        decoration: InputDecoration(
          hintText: 'example@example.com',
          hintStyle: TextStyle(color: Colors.white54),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _passwordFieldWidget() {
    return SizedBox(
      width: _deviceWidth * 0.70,
      child: TextField(
        autocorrect: false,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'password',
          hintStyle: TextStyle(color: Colors.white54),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      minWidth: _deviceWidth * 0.38,
      height: _deviceHeight * 0.055,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: Colors.white),
      ),
      onPressed: () {},
      child: Text(
        'LOG IN',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: _primaryColor,
        ),
      ),
    );
  }
}
