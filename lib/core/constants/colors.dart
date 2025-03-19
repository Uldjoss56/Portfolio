import 'package:flutter/material.dart';

const Color myTurquois = Color(0xFF0084A6);
const Color myTurquoisAA = Color(0xAA0084A6);
const Color myTurquois55 = Color(0x550084A6);
const Color myTurquois22 = Color(0x220084A6);

const Color myTurquois01 = Color(0xFF005A7C);
const Color myTurquois01AA = Color(0xAA005A7C);
const Color myTurquois0155 = Color(0x55005A7C);
const Color myTurquois0122 = Color(0x22005A7C);

const Color myOrange = Color(0xFFFFd500);
const Color myOrangeAA = Color(0xAAFFd500);
const Color myOrange55 = Color(0x55FFd500);
const Color myOrange22 = Color(0x22FFd500);

const Color myOrange01 = Color(0xFFE07800);
const Color myOrange01AA = Color(0xAAE07800);
const Color myOrange0155 = Color(0x55E07800);
const Color myOrange0122 = Color(0x22E07800);

const orangeTurquois = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    myOrange01AA,
    myTurquoisAA,
  ],
);

const buttonGradi = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    myTurquois,
    myTurquois02,
  ],
);

const Color myTurquois02 = Color(0xFF005A7C);
const Color myTurquois02AA = Color(0xAA005A7C);
const Color myTurquois0255 = Color(0x55005A7C);
const Color myTurquois0222 = Color(0x22005A7C);

const Color myBlueBackground = Color(0xFF000C1C);
const Color myBlueBackgroundAA = Color(0xAA000C1C);
const Color myBlueBackground55 = Color(0x55000C1C);
const Color myBlueBackground22 = Color(0x22000C1C);

const Color myGrey = Color(0xFFD9D9D9);
const Color myGreyAA = Color(0xAAD9D9D9);
const Color myGrey55 = Color(0x55D9D9D9);
const Color myGrey22 = Color(0x22D9D9D9);

const Color myBlack = Color(0xFF222222);
const Color myBlackAA = Color(0xAA222222);
const Color myBlack55 = Color(0x55222222);
const Color myBlack22 = Color(0x22222222);

const Color myWhite = Color(0xFFFEFEFE);
const Color myWhiteAA = Color(0xAAFEFEFE);
const Color myWhite55 = Color(0x55FEFEFE);
const Color myWhite22 = Color(0x22FEFEFE);

const Color myWhiteBackground = Color(0xFFEAEAEA);
const Color myWhiteBackgroundAA = Color(0xAAEAEAEA);
const Color myWhiteBackground55 = Color(0x55EAEAEA);
const Color myWhiteBackground22 = Color(0x22EAEAEA);

BoxShadow primaryColorShadow = BoxShadow(
  color: myTurquois.withAlpha(100),
  blurRadius: 12.0,
  offset: const Offset(0.0, 0.0),
);
