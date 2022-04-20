import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'my_flutter_app_icons.dart';

Color themeColor = Color.fromRGBO(195, 154, 41, 1);

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home_page(),
    );
  }
}

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {



  Widget buildCard(String imageName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0, color: Colors.white),
            borderRadius: BorderRadius.circular(13)),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        width: 70,
        height: 70,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image(
            image: AssetImage('assets/images/ourMenu/$imageName'),
          ),
        ),
      ),
    );
  }

  Widget buildCardText(String name) {
    return Text(
      '$name',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }

  Widget buildFavCard(String image, String head, String subhead, int rate) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.greenAccent,
              offset: const Offset(
                2.0,
                2.0,
              ),
              blurRadius: 2.0,
              spreadRadius: 2.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 0),
          borderRadius: BorderRadius.circular(13)),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0),
                borderRadius: BorderRadius.circular(13)),
            width: 100,
            height: 155,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image(image: AssetImage('assets/images/favourites/$image')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
            child: Container(
              width: 200,
              height: 155,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      '$head',
                      style: TextStyle(fontSize: 25, fontFamily: 'staatliches'),
                    ),
                  ),
                  Text(
                    '$subhead',
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹ $rate/-',
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'staatliches'),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: themeColor,
                            width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        width: 60,
                        height: 25,
                        child: Center(
                          child: Text('Add +',style: TextStyle(color: themeColor,fontFamily: 'staatliches'),),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  bool isSwitched = true;
  Color brownColor = Colors.brown.shade800;
  Color crownColor = themeColor;
  Color deliveryColor = themeColor;
  Color dineColor = Colors.grey;
  String varText = 'Deliver to';
  var pinIcon = Icons.pin_drop;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
      width: double.infinity,
      height: 50,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: Icon(
              MyFlutterApp.crown,
              color: crownColor,
              size: 25,
            ),
          ),
          Container(
            width: 260,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'DINE-IN/TAKEAWAY',
                  style: TextStyle(
                      fontFamily: 'Staatliches',
                      fontSize: 20,
                      color: dineColor
                    ),
                ),
                Switch(
                    activeTrackColor: themeColor,
                    activeColor: Colors.white,
                    inactiveTrackColor: brownColor,
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        if(isSwitched){
                          crownColor = brownColor;
                          deliveryColor = Colors.grey;
                          dineColor = brownColor;
                          varText = 'Select Store';
                          pinIcon = Icons.store;
                        }
                        else{
                          crownColor = themeColor;
                          deliveryColor = themeColor;
                          dineColor = Colors.grey;
                          varText = 'Deliver to';
                          pinIcon = Icons.pin_drop_rounded;
                          ;
                        }
                        isSwitched = value;
                      });
                    }),
                Text(
                  'DELIVERY',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Staatliches',
                      color: deliveryColor,
                    ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.search,
            size: 30,
            color: crownColor,
          ),
        ],
      ),
    ),
            Expanded(
              child: Container(
      color: const Color.fromRGBO(247, 247, 198, 1),
      width: double.infinity,
      child: ListView(
        children: [
          Container(
            height: 50,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  pinIcon,
                  color: crownColor,
                  size: 28,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    '$varText',
                    style: TextStyle(color: crownColor, fontSize: 16),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(18)),
                    width: 200,
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Address',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: themeColor,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            child: Image(
              image: AssetImage('assets/images/top/main.jpg'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                child: Text(
                  'Our menu',
                  style: TextStyle(fontSize: 28, fontFamily: 'staatliches'),
                ),
              ),
              Container(
                height: 171,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 100,
                        child: Column(
                          children: [
                            buildCard('1.png'),
                            buildCardText('Top Picks')
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 100,
                        child: Column(
                          children: [
                            buildCard('2.png'),
                            buildCardText('Home Delight Combos')
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 100,
                        child: Column(
                          children: [
                            buildCard('3.png'),
                            buildCardText('Whooper')
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 100,
                        child: Column(
                          children: [
                            buildCard('4.png'),
                            buildCardText('Sides')
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 100,
                        child: Column(
                          children: [
                            buildCard('5.png'),
                            buildCardText('Chicken Wings')
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 100,
                        child: Column(
                          children: [
                            buildCard('6.png'),
                            buildCardText('Beverages')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(
                    'KING DEALS OF THE DAY',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        fontFamily: 'staatliches',
                        letterSpacing: 1),
                  ),
                ),
                Container(
                  height: 125,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: 280,
                        color: Colors.red,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image(
                            image: AssetImage('assets/images/kingDeals/11.jpg'),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        width: 300,
                        color: Colors.red,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image(
                            image: AssetImage('assets/images/kingDeals/22.jpg'),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,40,0,30),
            child: Container(
              height: 200,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image(
                  image: AssetImage('assets/images/WhooperHere/whooper.jpg'),
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                  child: Text(
                    'Favourites',
                    style: TextStyle(fontSize: 28, fontFamily: 'staatliches',letterSpacing: 1),
                  ),
                ),
                Container(
                  height: 155,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildFavCard('1.jpg', 'crispy veg double patty + crispy veg...', 'crispy veg double patty + crispy veg double patty', 150),
                      buildFavCard('2.jpg', 'lite whooper jr veg + lite whooper jr...', 'lite whooper jr veg + lite whooper jr veg', 218),
                      buildFavCard('3.jpg', 'crispy chicken double patty + cri...', 'crispy chicken double patty + crispy chicken double patty', 238),
                      buildFavCard('4.jpg', 'veg whooper + veg whooper' , 'veg whooper + veg whooper', 298),
                      buildFavCard('5.jpg', 'chicken whooper + chicken whooper', 'chicken whooper + chicken whooper', 358)
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Container(
              height: 150,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image(
                  image: AssetImage('assets/images/BKwall/wall.jpg'),
                ),
              ),
            ),
          )
        ],
      ),
    ),
            ),
            bottomNavbar()
          ],
        ),
      ),
    );
  }
}

// class appBar extends StatefulWidget {
//   appBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<appBar> createState() => _appBarState();
// }

// class _appBarState extends State<appBar> {
//   bool isSwitched = true;
//   Color brownColor = Colors.brown.shade800;
//   Color crownColor = themeColor;
//   Color deliveryColor = themeColor;
//   Color dineColor = Colors.grey;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 50,
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
//             child: Icon(
//               MyFlutterApp.crown,
//               color: crownColor,
//               size: 25,
//             ),
//           ),
//           Container(
//             width: 260,
//             height: 40,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   'DINE-IN/TAKEAWAY',
//                   style: TextStyle(
//                       fontFamily: 'Staatliches',
//                       fontSize: 20,
//                       color: dineColor
//                     ),
//                 ),
//                 Switch(
//                     activeTrackColor: themeColor,
//                     activeColor: Colors.white,
//                     inactiveTrackColor: brownColor,
//                     value: isSwitched,
//                     onChanged: (value) {
//                       setState(() {
//                         if(isSwitched){
//                           crownColor = brownColor;
//                           deliveryColor = Colors.grey;
//                           dineColor = brownColor;
//                         }
//                         else{
//                           crownColor = themeColor;
//                           deliveryColor = themeColor;
//                           dineColor = Colors.grey;
//                         }
//                         isSwitched = value;
//                       });
//                     }),
//                 Text(
//                   'DELIVERY',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontFamily: 'Staatliches',
//                       color: deliveryColor,
//                     ),
//                 ),
//               ],
//             ),
//           ),
//           Icon(
//             Icons.search,
//             size: 30,
//             color: crownColor,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class scrollable extends StatefulWidget {
//   const scrollable({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<scrollable> createState() => _scrollableState();
// }

// class _scrollableState extends State<scrollable> {
//   Widget buildCard(String imageName) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(width: 0, color: Colors.white),
//             borderRadius: BorderRadius.circular(13)),
//         margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//         width: 70,
//         height: 70,
//         child: FittedBox(
//           fit: BoxFit.contain,
//           child: Image(
//             image: AssetImage('assets/images/ourMenu/$imageName'),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCardText(String name) {
//     return Text(
//       '$name',
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 15,
//       ),
//     );
//   }

//   Widget buildFavCard(String image, String head, String subhead, int rate) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
//       decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.greenAccent,
//               offset: const Offset(
//                 2.0,
//                 2.0,
//               ),
//               blurRadius: 2.0,
//               spreadRadius: 2.0,
//             ),
//             BoxShadow(
//               color: Colors.white,
//               offset: const Offset(0.0, 0.0),
//               blurRadius: 0.0,
//               spreadRadius: 0.0,
//             ),
//           ],
//           color: Colors.white,
//           border: Border.all(color: Colors.white, width: 0),
//           borderRadius: BorderRadius.circular(13)),
//       child: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.white, width: 0),
//                 borderRadius: BorderRadius.circular(13)),
//             width: 100,
//             height: 155,
//             child: FittedBox(
//               fit: BoxFit.fill,
//               child: Image(image: AssetImage('assets/images/favourites/$image')),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
//             child: Container(
//               width: 200,
//               height: 155,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                     child: Text(
//                       '$head',
//                       style: TextStyle(fontSize: 25, fontFamily: 'staatliches'),
//                     ),
//                   ),
//                   Text(
//                     '$subhead',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '₹ $rate/-',
//                         style:
//                             TextStyle(fontSize: 20, fontFamily: 'staatliches'),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: themeColor,
//                             width: 1.5
//                           ),
//                           borderRadius: BorderRadius.circular(20)
//                         ),
//                         width: 60,
//                         height: 25,
//                         child: Center(
//                           child: Text('Add +',style: TextStyle(color: themeColor,fontFamily: 'staatliches'),),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color.fromRGBO(247, 247, 198, 1),
//       width: double.infinity,
//       child: ListView(
//         children: [
//           Container(
//             height: 50,
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.pin_drop,
//                   color: themeColor,
//                   size: 28,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   child: Text(
//                     'Deliver to',
//                     style: TextStyle(color: themeColor, fontSize: 15),
//                   ),
//                 ),
//                 Container(
//                     decoration: BoxDecoration(
//                         color: Colors.grey[100],
//                         border: Border.all(color: Colors.grey.shade300),
//                         borderRadius: BorderRadius.circular(18)),
//                     width: 200,
//                     height: 30,
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Your Address',
//                             style: TextStyle(color: Colors.black54),
//                           ),
//                           Icon(
//                             Icons.arrow_drop_down,
//                             color: themeColor,
//                           )
//                         ],
//                       ),
//                     ))
//               ],
//             ),
//           ),
//           Container(
//             child: Image(
//               image: AssetImage('assets/images/top/main.jpg'),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
//                 child: Text(
//                   'Our menu',
//                   style: TextStyle(fontSize: 28, fontFamily: 'staatliches'),
//                 ),
//               ),
//               Container(
//                 height: 171,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: <Widget>[
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                         width: 100,
//                         child: Column(
//                           children: [
//                             buildCard('1.png'),
//                             buildCardText('Top Picks')
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                         width: 100,
//                         child: Column(
//                           children: [
//                             buildCard('2.png'),
//                             buildCardText('Home Delight Combos')
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                         width: 100,
//                         child: Column(
//                           children: [
//                             buildCard('3.png'),
//                             buildCardText('Whooper')
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                         width: 100,
//                         child: Column(
//                           children: [
//                             buildCard('4.png'),
//                             buildCardText('Sides')
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                         width: 100,
//                         child: Column(
//                           children: [
//                             buildCard('5.png'),
//                             buildCardText('Chicken Wings')
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                         width: 100,
//                         child: Column(
//                           children: [
//                             buildCard('6.png'),
//                             buildCardText('Beverages')
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Container(
//             width: double.infinity,
//             height: 180,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
//                   child: Text(
//                     'KING DEALS OF THE DAY',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 28,
//                         fontFamily: 'staatliches',
//                         letterSpacing: 1),
//                   ),
//                 ),
//                 Container(
//                   height: 125,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                         width: 280,
//                         color: Colors.red,
//                         child: FittedBox(
//                           fit: BoxFit.fill,
//                           child: Image(
//                             image: AssetImage('assets/images/kingDeals/11.jpg'),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
//                         width: 300,
//                         color: Colors.red,
//                         child: FittedBox(
//                           fit: BoxFit.fill,
//                           child: Image(
//                             image: AssetImage('assets/images/kingDeals/22.jpg'),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0,40,0,30),
//             child: Container(
//               height: 200,
//               child: FittedBox(
//                 fit: BoxFit.contain,
//                 child: Image(
//                   image: AssetImage('assets/images/WhooperHere/whooper.jpg'),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 250,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
//                   child: Text(
//                     'Favourites',
//                     style: TextStyle(fontSize: 28, fontFamily: 'staatliches',letterSpacing: 1),
//                   ),
//                 ),
//                 Container(
//                   height: 155,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       buildFavCard('1.jpg', 'crispy veg double patty + crispy veg...', 'crispy veg double patty + crispy veg double patty', 150),
//                       buildFavCard('2.jpg', 'lite whooper jr veg + lite whooper jr...', 'lite whooper jr veg + lite whooper jr veg', 218),
//                       buildFavCard('3.jpg', 'crispy chicken double patty + cri...', 'crispy chicken double patty + crispy chicken double patty', 238),
//                       buildFavCard('4.jpg', 'veg whooper + veg whooper' , 'veg whooper + veg whooper', 298),
//                       buildFavCard('5.jpg', 'chicken whooper + chicken whooper', 'chicken whooper + chicken whooper', 358)
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.fromLTRB(20,0,20,0),
//             child: Container(
//               height: 150,
//               child: FittedBox(
//                 fit: BoxFit.cover,
//                 child: Image(
//                   image: AssetImage('assets/images/BKwall/wall.jpg'),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }



















class bottomNavbar extends StatelessWidget {
  const bottomNavbar({
    Key? key,
  }) : super(key: key);

  Widget navItem(var navItemIcon, String navItemLabel, Color iconColor) {
    return Container(
      width: 80,
      // color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            navItemIcon,
            size: 30,
            color: iconColor,
          ),
          Text(
            '$navItemLabel',
            style: TextStyle(fontFamily: 'Staatliches', color: iconColor),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.greenAccent,
          offset: const Offset(
            5.0,
            5.0,
          ),
          blurRadius: 10.0,
          spreadRadius: 2.0,
        ),
        BoxShadow(
          color: Colors.white,
          offset: const Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ),
      ]),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(Icons.home, 'Home', themeColor),
          navItem(Icons.book, 'Our Menu', Colors.grey),
          navItem(Icons.calculate, 'KING DEALS', Colors.grey),
          navItem(Icons.store, 'Neaby Store', Colors.grey),
        ],
      ),
    );
  }
}
