import 'package:flutter/material.dart';
import 'detailResourcePage.dart';
import 'package:yotecuido/models/constantsResource.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:yotecuido/models/dataResource.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Categorías de Rutinas',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 32,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  padding: const EdgeInsets.only(left: 32),
                  child: Swiper(
                    itemCount: guia.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                      builder:
                          DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => DetailPage(
                                guiaInfo: guia[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(height: 100),
                                Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(height: 100),
                                        Text(
                                          guia[index].name,
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 22,
                                            color: const Color(0xff47455f),
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          'Guia',
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 18,
                                            color: primaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(height: 32),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Ver',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 24,
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: secondaryTextColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Hero(
                            //tag: guia[index].position,
                            //child: Image.asset(guia[index].iconImage),
                            //),
                            Positioned(
                              right: 24,
                              bottom: 60,
                              child: Text(
                                guia[index].position.toString(),
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 200,
                                  color: primaryTextColor.withOpacity(0.08),
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
