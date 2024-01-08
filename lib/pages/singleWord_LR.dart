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
        // Wrg (1:141)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfc000000),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupsctnjsr (P2LPWNRhb8bYWWdNpascTn)
              padding: EdgeInsets.fromLTRB(13*fem, 20*fem, 13*fem, 192.47*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogrouphxmno72 (P2LNLjhjAX3EjH4TCmHXmn)
                    margin: EdgeInsets.fromLTRB(123.5*fem, 0*fem, 8*fem, 78*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // goenghy6 (1:180)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 89.5*fem, 0*fem),
                          child: Text(
                            'GOENG',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Inter',
                              fontSize: 24*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // iconmagnifyingglassB16 (1:231)
                          width: 25*fem,
                          height: 27.01*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-magnifying-glass.png',
                            width: 25*fem,
                            height: 27.01*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogrouprnxcGoE (P2LNZjL5S71jHgXMDeRnxc)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 65*fem),
                    width: double.infinity,
                    height: 247*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // bayousa3E (1:155)
                          left: 105.5*fem,
                          top: 173*fem,
                          child: Align(
                            child: SizedBox(
                              width: 123*fem,
                              height: 44*fem,
                              child: Text(
                                'bayous',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 36*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // vibratorSLL (1:157)
                          left: 100.5*fem,
                          top: 179*fem,
                          child: Align(
                            child: SizedBox(
                              width: 133*fem,
                              height: 44*fem,
                              child: Text(
                                'vibrator',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 36*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // rectangle17gVa (1:190)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 334*fem,
                              height: 247*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(20*fem),
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // bayouskVS (1:191)
                          left: 105.5*fem,
                          top: 55*fem,
                          child: Align(
                            child: SizedBox(
                              width: 123*fem,
                              height: 44*fem,
                              child: Text(
                                'bayous',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 36*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // nounCcL (1:193)
                          left: 143.5*fem,
                          top: 105*fem,
                          child: Align(
                            child: SizedBox(
                              width: 47*fem,
                              height: 25*fem,
                              child: Text(
                                'noun',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // line2hJC (1:194)
                          left: 36.7420654297*fem,
                          top: 142.4999694824*fem,
                          child: Align(
                            child: SizedBox(
                              width: 267.2*fem,
                              height: 1.1*fem,
                              child: Image.asset(
                                'assets/page-1/images/line-2.png',
                                width: 267.2*fem,
                                height: 1.1*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // pluralformofbayouos2 (1:195)
                          left: 49.5*fem,
                          top: 165*fem,
                          child: Align(
                            child: SizedBox(
                              width: 235*fem,
                              height: 30*fem,
                              child: Text(
                                'Plural form of bayou.',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 24*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125*ffem/fem,
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
                    // autogrouppee8feL (P2LNotb9g7bn9sDpA9PeE8)
                    margin: EdgeInsets.fromLTRB(34*fem, 0*fem, 34.47*fem, 0*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupqnfvzgc (P2LNvJa8XSyLqf1SF3QNfv)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 86.47*fem, 0*fem),
                          width: 89.53*fem,
                          height: 89.53*fem,
                          child: Image.asset(
                            'assets/page-1/images/auto-group-qnfv.png',
                            width: 89.53*fem,
                            height: 89.53*fem,
                          ),
                        ),
                        Container(
                          // autogroupegmj6je (P2LP5t8WADir58iTQceGmJ)
                          width: 89.53*fem,
                          height: 89.53*fem,
                          child: Image.asset(
                            'assets/page-1/images/auto-group-egmj.png',
                            width: 89.53*fem,
                            height: 89.53*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupxmxxEax (P2LPExhi6EnFk8kX2vXmxx)
              padding: EdgeInsets.fromLTRB(60*fem, 17*fem, 44*fem, 20.93*fem),
              width: double.infinity,
              height: 78*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Container(
                // autogroupqidjNBN (P2LPLNiMY4mdJyCE3HqidJ)
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // iconhouseWYU (1:144)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 176*fem, 0*fem),
                      width: 40*fem,
                      height: 37.07*fem,
                      child: Image.asset(
                        'assets/page-1/images/icon-house-Xsi.png',
                        width: 40*fem,
                        height: 37.07*fem,
                      ),
                    ),
                    Container(
                      // iconusercirclecrQ (1:146)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.06*fem),
                      width: 40*fem,
                      height: 40.01*fem,
                      child: Image.asset(
                        'assets/page-1/images/icon-user-circle.png',
                        width: 40*fem,
                        height: 40.01*fem,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}
