// sacleFactor
// responsive font size
// (min , max) fontsize
import 'package:flutter/material.dart';
import 'package:notepad/core/utils/size_config.dart';

abstract class AppStyle {
  static TextStyle styleRegular12(context) {
    return TextStyle(
      color: const Color(0xff868484),
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
    );
  }

  static TextStyle styleBold12(context) {
    return TextStyle(
      color: const Color(0xff868484),
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
    );
  }

  static TextStyle styleBold14(context) {
    return TextStyle(
      color: const Color(0xffFFFFFF),
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
    );
  }

  static TextStyle styleRegular14(context) {
    return TextStyle(
      color: const Color(0xff3D3B3B),
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
    );
  }

  static TextStyle styleRegular16(context) {
    return TextStyle(
      color: const Color(0xff3D3B3B),
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
    );
  }

  static TextStyle styleMedium16(context) {
    return TextStyle(
      color: const Color(0xff3D3B3B),
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
    );
  }

  static TextStyle styleBold20(context) {
    return TextStyle(
      color: const Color(0xff3D3B3B),
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
    );
  }

  static TextStyle styleBold24(context) {
    return TextStyle(
      color: const Color(0xff3D3B3B),
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
    );
  }

  static TextStyle styleRegular48(context) {
    return TextStyle(
      color: const Color(0xff703410),
      fontFamily: 'Mansalva',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, fontSize: 48),
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 450;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
