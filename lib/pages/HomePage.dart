import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/animations/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        brightness: Brightness.light,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.grey[900],), onPressed: (){
          Navigator.pop(context);
        }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.grey[800],
              ),
              onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      'Food Delivery',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        FadeAnimation(
                          1,
                          makeCards(isActive: true, title: 'Pizza'),
                        ),
                        FadeAnimation(
                          1.2,
                          makeCards(isActive: false, title: 'Burger'),
                        ),
                        FadeAnimation(
                          1.4,
                          makeCards(isActive: false, title: 'Kebab'),
                        ),
                        FadeAnimation(
                          1.6,
                          makeCards(isActive: false, title: 'Cake'),
                        ),
                        FadeAnimation(
                          1.8,
                          makeCards(isActive: false, title: 'Biryani'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            FadeAnimation(
              1,
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Free Delivery',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FadeAnimation(1, makeItem(image: 'assets/images/one.jpg',title: 'Breads & Buns',price:'\$ 15.00')),
                    FadeAnimation(1, makeItem(image: 'assets/images/two.jpg',title: 'Pancake',price:'\$ 14.30')),
                    FadeAnimation(1, makeItem(image: 'assets/images/three.jpg',title:'Pasta',price:'\$ 18.95')),
                    FadeAnimation(1, makeItem(image: 'assets/images/four.jpg',title:'Burger',price:'\$ 20.10')),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget makeCards({isActive, title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[500],
              fontSize: 18,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image,title,price}) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight,
                  stops: [0.2,0.9],
                  colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.3),
              ]),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.favorite,color: Colors.white,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(price,style: TextStyle(color: Colors.white,fontSize: 40, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text(title,style: TextStyle(color: Colors.white,fontSize: 20,),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
