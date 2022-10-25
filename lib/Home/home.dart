import 'package:animate_do/animate_do.dart';
import 'package:app_travel/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../drawer/constant.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final _pageController = PageController(viewportFraction: 0.877);
  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toDouble();
        print(currentPage);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      drawer: mainDrawer(3),
      appBar: dm(),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40, left: 21),
                child: Text('Explore Your\nVacation',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(top: 21),
                height: 181,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 229,
                      margin: EdgeInsets.only(right: 21, left: 21),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: new AssetImage('assets/image/Mountain 2.jpg'),
                        ),
                      ),
                      // ignore: sort_child_properties_last
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'Mountain \nEverest',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              ),
                            ),
                            IconTheme(
                              data: IconThemeData(
                                color: Colors.amber,
                                size: 15,
                              ),
                              child: StarDisplay(value: 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 229,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              new AssetImage('assets/image/Water fall 2.jpg'),
                        ),
                      ),
                      // ignore: sort_child_properties_last
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'WaterFall \nTres Hermanas',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              ),
                            ),
                            IconTheme(
                              data: IconThemeData(
                                color: Colors.amber,
                                size: 15,
                              ),
                              child: StarDisplay(value: 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 34,
              ),
              Container(
                margin: EdgeInsets.only(left: 21.0),
                child: Text(
                  'Popular Search',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              //Gambar popular
              Container(
                height: 173,
                margin: EdgeInsets.only(left: 21.0, top: 15.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: 21),
                        width: 134,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                new AssetImage('assets/image/Water fall 2.jpg'),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, bottom: 15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Mountain \nEverest',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    new Image.asset('assets/image/love.png'),
                                    Text(
                                      '400',
                                      style:
                                          TextStyle(fontSize: 10, color: white),
                                    ),
                                    SizedBox(width: 10),
                                    new Image.asset('assets/image/export.png'),
                                    Text(
                                      '300',
                                      style:
                                          TextStyle(fontSize: 10, color: white),
                                    ),
                                  ],
                                ),
                              ]),
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 21),
                        width: 134,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: new AssetImage('assets/image/ocean 1.jpg'),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, bottom: 15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Mountain \nEverest',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    new Image.asset('assets/image/love.png'),
                                    Text(
                                      '400',
                                      style:
                                          TextStyle(fontSize: 10, color: white),
                                    ),
                                    SizedBox(width: 10),
                                    new Image.asset('assets/image/export.png'),
                                    Text(
                                      '300',
                                      style:
                                          TextStyle(fontSize: 10, color: white),
                                    ),
                                  ],
                                ),
                              ]),
                        )),
                    Container(
                      margin: EdgeInsets.only(right: 21),
                      width: 134,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: new AssetImage('assets/image/Lake 2.jpg'),
                        ),
                      ),
                     child: Container(
                          margin: EdgeInsets.only(left: 10, bottom: 15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Mountain \nEverest',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    new Image.asset('assets/image/love.png'),
                                    Text(
                                      '400',
                                      style:
                                          TextStyle(fontSize: 10, color: white),
                                    ),
                                    SizedBox(width: 10),
                                    new Image.asset('assets/image/export.png'),
                                    Text(
                                      '300',
                                      style:
                                          TextStyle(fontSize: 10, color: white),
                                    ),
                                  ],
                                ),
                              ]),
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 21),
                        width: 134,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: new AssetImage('assets/image/ocean 2.jpg'),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, bottom: 15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Mountain \nEverest',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    new Image.asset('assets/image/love.png'),
                                    Text(
                                      '400',
                                      style:
                                          TextStyle(fontSize: 10, color: white),
                                    ),
                                    SizedBox(width: 10),
                                    new Image.asset('assets/image/export.png'),
                                    Text(
                                      '300',
                                      style:
                                          TextStyle(fontSize: 10, color: white),
                                    ),
                                  ],
                                ),
                              ]),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class dm extends StatelessWidget with PreferredSizeWidget {
  const dm({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 100),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    );
  }
}

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key? key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
