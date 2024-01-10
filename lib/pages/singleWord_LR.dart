import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:goeng/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // Ggt (1:141)
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfc000000),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupc6fvL4U (BZou3177E6AyEu5mdVC6fv)
              padding:
                  EdgeInsets.fromLTRB(13 * fem, 20 * fem, 12 * fem, 126 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupxeyanSG (BZosq7wt961ESWzY5yXEyA)
                    margin: EdgeInsets.fromLTRB(
                        123.5 * fem, 0 * fem, 16 * fem, 41 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // goengJfW (1:180)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 89.5 * fem, 0 * fem),
                          child: Text(
                            'GOENG',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 24 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // iconmagnifyingglassQMA (1:231)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 2.62 * fem, 0 * fem, 0 * fem),
                          width: 18 * fem,
                          height: 17.7 * fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-magnifying-glass.png',
                            width: 18 * fem,
                            height: 17.7 * fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupsfwtgpU (BZotTrPgHTKH6arvCvsFWt)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 6 * fem),
                    padding: EdgeInsets.fromLTRB(
                        36.74 * fem, 28 * fem, 31.06 * fem, 25 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // bayousAje (1:191)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 6.68 * fem, 17 * fem),
                          child: Text(
                            'bayous',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 36 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // nounHJU (1:193)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 6.68 * fem, 12.5 * fem),
                          child: Text(
                            'noun',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // line2ySC (1:194)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 21.4 * fem),
                          width: 267.2 * fem,
                          height: 1.1 * fem,
                          child: Image.asset(
                            'assets/page-1/images/line-2.png',
                            width: 267.2 * fem,
                            height: 1.1 * fem,
                          ),
                        ),
                        Container(
                          // pluralformofbayouGw6 (1:195)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 6.68 * fem, 0 * fem),
                          child: Text(
                            'Plural form of bayou.',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 24 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupu9mnwnL (BZotdr72LX9CJ8J4zDu9MN)
                    margin: EdgeInsets.fromLTRB(
                        100.5 * fem, 0 * fem, 101.5 * fem, 23 * fem),
                    width: double.infinity,
                    height: 50 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // bayous4c4 (1:155)
                          left: 5 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 123 * fem,
                              height: 44 * fem,
                              child: Text(
                                'bayous',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 36 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // vibratorxSY (1:157)
                          left: 0 * fem,
                          top: 6 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 133 * fem,
                              height: 44 * fem,
                              child: Text(
                                'vibrator',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 36 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125 * ffem / fem,
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
                    // autogroupugwnFAk (BZotkLvCUK8SaL2WzfUGwn)
                    margin: EdgeInsets.fromLTRB(
                        34 * fem, 0 * fem, 30 * fem, 0 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // P24 (25:58)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 49 * fem, 0 * fem),
                          width: 111 * fem,
                          height: 120 * fem,
                          child: Image.asset(
                            'assets/page-1/images/2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          // Jui (25:57)
                          width: 111 * fem,
                          height: 120 * fem,
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
              // autogroupv1paG5r (BZotrkuBKeW1G7p95ZV1Pa)
              padding: EdgeInsets.fromLTRB(
                  53 * fem, 26.05 * fem, 53 * fem, 28.26 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // iconhouseacL (1:144)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 2.8 * fem, 174 * fem, 0 * fem),
                    width: 40 * fem,
                    height: 32.9 * fem,
                    child: Image.asset(
                      'assets/page-1/images/icon-house.png',
                      width: 40 * fem,
                      height: 32.9 * fem,
                    ),
                  ),
                  Container(
                    // iconusercirclegvG (1:146)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 0.19 * fem),
                    width: 40 * fem,
                    height: 35.51 * fem,
                    child: Image.asset(
                      'assets/page-1/images/icon-user-circle.png',
                      width: 40 * fem,
                      height: 35.51 * fem,
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
