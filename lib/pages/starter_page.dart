import 'package:flutter/material.dart';
import 'package:foody/animations/FadeAnimation.dart';
import 'package:foody/pages/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget {
  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;

  bool _textVisible = true;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    animation = Tween<double>(
      begin: 1.0,end: 25.0
    ).animate(animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onTap(){
    setState(() {
      _textVisible = false;
    });
    animationController.forward().then((f) => Navigator.push(context, PageTransition(child: HomePage(), type: PageTransitionType.fade)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Starter-image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.2)
            ],
          )),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FadeAnimation(
                      0.5,
                      Text(
                        'Taking Order For Delivery',
                        style: TextStyle(
                          fontSize: 53,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeAnimation(
                      1,
                      Text(
                        'See your restaurants nearby \nadding location',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          height: 1.4,
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                    FadeAnimation(
                      1.2,
                      ScaleTransition(
                        scale: animation,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Color(0xfff12711),
                                Color(0xfff5af19)
                              ])),
                          child: AnimatedOpacity(
                            opacity: _textVisible ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 50),
                            child: MaterialButton(
                              onPressed: () => onTap(),
                              child: Text(
                                'Start',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    FadeAnimation(
                      1.4,
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 50),
                        opacity: _textVisible ? 1.0 : 0.0,
                        child: Align(
                          child: Text(
                            'Now Deliver To Your Door 24/7',
                            style: TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
