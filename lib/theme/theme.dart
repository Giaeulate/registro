import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static Color primary = Colors.blue;
  static Color orange = Colors.orange;
  static Color black = const Color(0xff222222);
  static Color grey = const Color(0xff777777);
  static Color lightGrey = const Color(0xffECEEF2);
  static Color red = const Color(0xffAD0F31);
  static Color yellow = const Color(0xffF9E300);
  static Color white = const Color(0xffffffff);
  static Color green = const Color(0xff198754);
  static Color backgroundGrey = const Color(0xffF5F5F5);
  static Color disableButtonColor = const Color(0xffCCCCCC);
  static Color disableTextButtonColor = const Color(0xff5E5873);
  static Color softGrey = const Color.fromRGBO(
    237,
    239,
    244,
    0.25,
  );
  static Color softRed = const Color.fromRGBO(173, 15, 49, 0.05);

  static OutlineInputBorder focusBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(4.0),
    ),
    borderSide: BorderSide(
      color: primary,
      width: 2,
    ),
  );

  static OutlineInputBorder disableBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(4.0),
    ),
    borderSide: BorderSide(
      color: lightGrey,
      width: 1.5,
    ),
  );

  static ThemeData getApplicationTheme() {
    return ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      useMaterial3: true,
      scaffoldBackgroundColor: ApplicationTheme.white,

      iconTheme: IconThemeData(
        color: black,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 24.0,
        ),
        displayMedium: TextStyle(
          fontSize: 22.0,
        ),
        displaySmall: TextStyle(
          fontSize: 20.0,
        ),
        headlineMedium: TextStyle(
          fontSize: 18.0,
        ),
        headlineSmall: TextStyle(
          fontSize: 16.0,
        ),
        titleLarge: TextStyle(
          fontSize: 14.0,
        ),
      ),

      dividerTheme: DividerThemeData(
        thickness: 1.0,
        color: yellow,
      ),

      // progressIndicatorTheme: const ProgressIndicatorThemeData(
      //   color: ApplicationTheme.white,
      // ),
      // tabBarTheme: TabBarTheme(
      //   indicator: UnderlineTabIndicator(
      //     borderSide: BorderSide(
      //       color: purple,
      //       width: 2.0,
      //     ),
      //   ),
      // ),
      // checkboxTheme: CheckboxThemeData(
      //   checkColor: MaterialStateProperty.all(
      //     ApplicationTheme.white,
      //   ),
      //   fillColor: MaterialStateProperty.all(
      //     purple,
      //   ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(4.0),
      //   ),
      // ),
      // switchTheme: SwitchThemeData(
      //   overlayColor: MaterialStateProperty.all(
      //     Colors.transparent,
      //   ),
      //   splashRadius: 0.0,
      // ),
      // splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   backgroundColor: ApplicationTheme.white,
      //   enableFeedback: true,
      //   selectedItemColor: purple,
      //   unselectedItemColor: black.withOpacity(0.2),
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   type: BottomNavigationBarType.fixed,
      //   elevation: 0.0,
      // ),
      // dividerTheme: DividerThemeData(
      //   thickness: 1.0,
      //   color: black.withOpacity(0.15),
      //   space: 30.0,
      // ),
      // primaryColor: purple,
      // scaffoldBackgroundColor: ApplicationTheme.white,
      // fontFamily: 'Avenir',
      // appBarTheme: AppBarTheme(
      //   backgroundColor: ApplicationTheme.white,
      //   elevation: 0.0,
      //   iconTheme: IconThemeData(
      //     color: black,
      //   ),
      // ),
      // radioTheme: RadioThemeData(
      //   fillColor: MaterialStateProperty.resolveWith<Color?>(
      //     (states) {
      //       if (states.contains(MaterialState.disabled)) {
      //         return const Color(0xffA9B1B7);
      //       } else {
      //         return purple;
      //       }
      //     },
      //   ),
      // ),
      // sliderTheme: SliderThemeData(
      //   activeTrackColor: orange,
      //   inactiveTrackColor: ApplicationTheme.white.withOpacity(0.6),
      //   showValueIndicator: ShowValueIndicator.always,
      //   thumbColor: orange,
      //   overlayColor: Colors.transparent,
      //   overlayShape: const RoundSliderOverlayShape(
      //     overlayRadius: 0.0,
      //   ),
      //   valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      //   valueIndicatorColor: ApplicationTheme.white,
      //   valueIndicatorTextStyle: TextStyle(
      //     fontFamily: 'Gilroy',
      //     color: black,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      // iconTheme: IconThemeData(
      //   color: black,
      // ),
      // inputDecorationTheme: InputDecorationTheme(
      //   floatingLabelBehavior: FloatingLabelBehavior.always,
      //   border: UnderlineInputBorder(
      //     borderSide: BorderSide(
      //       color: black.withOpacity(0.1),
      //       width: 1.0,
      //     ),
      //   ),
      //   enabledBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(
      //       color: black.withOpacity(0.1),
      //       width: 1.0,
      //     ),
      //   ),
      //   focusedBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(
      //       color: purple,
      //       width: 1.0,
      //     ),
      //   ),
      //   errorBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(
      //       color: orange,
      //       width: 1.0,
      //     ),
      //   ),
      //   focusedErrorBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(
      //       color: orange,
      //       width: 1.0,
      //     ),
      //   ),
      //   disabledBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(
      //       color: black.withOpacity(0.1),
      //       width: 1.0,
      //     ),
      //   ),
      // ),
    );
  }
}
