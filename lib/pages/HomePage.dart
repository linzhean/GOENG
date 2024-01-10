import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:goeng/utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // 設定基準寬度和高度
    double baseWidth = 360;
    double baseHeight = 640;

    // 計算寬度和高度的縮放比例
    double widthScale = screenWidth / baseWidth;
    double heightScale = screenHeight / baseHeight;

    return Container(
      width: double.infinity,
      child: Container(
        // 背景 Container
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfc000000),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(13 * widthScale, 20 * heightScale, 12 * widthScale, 126 * heightScale),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(123.5 * widthScale, 0, 16 * widthScale, 41 * heightScale),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 89.5 * widthScale, 0),
                          child: Text(
                            'GOENG',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 24 * widthScale,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * heightScale,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2.62 * heightScale, 0, 0),
                          width: 18 * widthScale,
                          height: 17.7 * heightScale,
                          child: Image.asset(
                            'assets/page-1/images/icon-magnifying-glass.png',
                            width: 18 * widthScale,
                            height: 17.7 * heightScale,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6 * heightScale),
                    padding: EdgeInsets.fromLTRB(36.74 * widthScale, 28 * heightScale, 31.06 * widthScale, 25 * heightScale),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20 * widthScale),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 6.68 * widthScale, 17 * heightScale),
                          child: Text(
                            'bayous',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 36 * widthScale,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * heightScale,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 6.68 * widthScale, 12.5 * heightScale),
                          child: Text(
                            'noun',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 20 * widthScale,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * heightScale,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 21.4 * heightScale),
                          width: 267.2 * widthScale,
                          height: 1.1 * heightScale,
                          child: Image.asset(
                            'assets/page-1/images/line-2.png',
                            width: 267.2 * widthScale,
                            height: 1.1 * heightScale,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 6.68 * widthScale, 0),
                          child: Text(
                            'Plural form of bayou.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 24 * widthScale,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * heightScale,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(100.5 * widthScale, 0, 101.5 * widthScale, 23 * heightScale),
                    width: double.infinity,
                    height: 50 * heightScale,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 5 * widthScale,
                          top: 0,
                          child: Align(
                            child: SizedBox(
                              width: 123 * widthScale,
                              height: 44 * heightScale,
                              child: Text(
                                'bayous',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 36 * widthScale,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125 * heightScale,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 6 * heightScale,
                          child: Align(
                            child: SizedBox(
                              width: 133 * widthScale,
                              height: 44 * heightScale,
                              child: Text(
                                'vibrator',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 36 * widthScale,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125 * heightScale,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(34 * widthScale, 0, 30 * widthScale, 0),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 49 * widthScale, 0),
                          width: 111 * widthScale,
                          height: 120 * heightScale,
                          child: Image.asset(
                            'assets/page-1/images/2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 111 * widthScale,
                          height: 120 * heightScale,
                          child: Image.asset(
                            'assets/page-1/images/-g28.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(53 * widthScale, 26.05 * heightScale, 53 * widthScale, 28.26 * heightScale),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 2.8 * heightScale, 174 * widthScale, 0),
                    width: 40 * widthScale,
                    height: 32.9 * heightScale,
                    child: Image.asset(
                      'assets/page-1/images/icon-house.png',
                      width: 40 * widthScale,
                      height: 32.9 * heightScale,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0.19 * heightScale),
                      width: 40 * widthScale,
                      height: 35.51 * heightScale,
                      child: Image.asset(
                        'assets/page-1/images/icon-user-circle.png',
                        width: 40 * widthScale,
                        height: 35.51 * heightScale,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}