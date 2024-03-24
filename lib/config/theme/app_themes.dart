import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}



// import 'app_colors.dart';

/// App Theme
///===
typedef AT = AppTheme;

class AppTheme {
  static final _instance = AppTheme._();
  factory AppTheme() => _instance;
  static AppTheme get instance => _instance;
  AppTheme._();
  int c = 0XFFAABBCC;

  static final ThemeData themeDataLight = ThemeData(
    brightness: Brightness.light,
    applyElevationOverlayColor: true,
    useMaterial3: true,
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    primaryColorLight: Colors.lightBlueAccent,
    primaryColorDark: Colors.blue,
    canvasColor: Colors.grey[50],
    scaffoldBackgroundColor: Colors.grey[50],
    cardColor: Colors.white,
    dividerColor: Colors.grey,
    focusColor: Colors.blue,
    hoverColor: Colors.grey[300],
    highlightColor: Colors.blue[300],
    splashColor: Colors.blue[100],
    unselectedWidgetColor: Colors.grey,
    disabledColor: Colors.grey[400],
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme.light(primary: Colors.blue),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.blueAccent,
      disabledForegroundColor: Colors.grey,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    )),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.green,
      onPrimary: Colors.blue,
      secondary: Colors.lightBlue,
      onSecondary: Colors.grey,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.white,
      onBackground: Colors.white10,
      surface: Colors.white,
      onSurface: Colors.white10,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.blue.withOpacity(0.9),
      elevation: 4,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[300],
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey[400],
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: const TextStyle(color: Colors.white),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.blue,
      contentTextStyle: const TextStyle(color: Colors.white),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      thickness: 1,
      space: 8,
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: Colors.blue,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Colors.grey[300]),
      selectedLabelTextStyle: const TextStyle(color: Colors.white),
      unselectedLabelTextStyle: TextStyle(color: Colors.grey[300]),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
      hourMinuteTextColor: Colors.black,
      dayPeriodTextColor: Colors.black,
      dialHandColor: Colors.blue,
      dialBackgroundColor: Colors.blue[50],
      entryModeIconColor: Colors.blue,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.blue,
      inactiveTrackColor: Colors.grey,
      thumbColor: Colors.blue,
      overlayColor: Colors.blue.withOpacity(0.3),
      trackHeight: 4,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.blue),
      trackColor: MaterialStateProperty.all(Colors.grey),
      overlayColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.2)),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.blue),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(Colors.blue),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.blue),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(const BorderSide(color: Colors.blue)),
        foregroundColor: MaterialStateProperty.all(Colors.blue),
      ),
    ),
    dialogBackgroundColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.blue,
      selectionColor: Colors.blue.withOpacity(0.3),
      selectionHandleColor: Colors.blue,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.5)),
      trackColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.1)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.grey[300],
      selectedColor: Colors.blue,
      secondarySelectedColor: Colors.blue[200],
      labelStyle: const TextStyle(color: Colors.black),
      secondaryLabelStyle: const TextStyle(color: Colors.white),
      padding: const EdgeInsets.all(8),
      shape: const StadiumBorder(),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white,
      elevation: 8,
      textStyle: TextStyle(color: Colors.black),
    ),
    typography: Typography.material2021(
      platform: TargetPlatform.android,
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      color: Colors.blue,
      selectedColor: Colors.white,
      fillColor: Colors.blue,
      borderRadius: BorderRadius.circular(8),
      borderWidth: 1.5,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 96, fontWeight: FontWeight.w300, color: Colors.black),
      displayMedium: TextStyle(
          fontSize: 60, fontWeight: FontWeight.w400, color: Colors.black),
      displaySmall: TextStyle(
          fontSize: 48, fontWeight: FontWeight.w400, color: Colors.black),
      headlineMedium: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w400, color: Colors.black),
      headlineSmall: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
      bodyLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54),
      labelLarge: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.green),

    ///============================================================================================
    ///============================================================================================
    ///============================================================================================
    pageTransitionsTheme: null,
    colorSchemeSeed: null,
    hintColor: null,
    indicatorColor: null,
    secondaryHeaderColor: null,
    shadowColor: null,
    fontFamily: null,
    fontFamilyFallback: null,
    iconTheme: null,
    primaryIconTheme: null,
    primaryTextTheme: null,
    actionIconTheme: null,
    badgeTheme: null,
    bannerTheme: null,
    buttonBarTheme: null,
    dataTableTheme: null,
    datePickerTheme: null,
    drawerTheme: null,
    dropdownMenuTheme: null,
    expansionTileTheme: null,
    filledButtonTheme: null,
    floatingActionButtonTheme: null,
    iconButtonTheme: null,
    listTileTheme: null,
    menuBarTheme: null,
    menuButtonTheme: null,
    menuTheme: null,
    navigationBarTheme: null,
    navigationDrawerTheme: null,
    progressIndicatorTheme: null,
    searchBarTheme: null,
    searchViewTheme: null,
    segmentedButtonTheme: null,
  );

  static final ThemeData allProperty = ThemeData(
    applyElevationOverlayColor: true,
    inputDecorationTheme: const InputDecorationTheme(),
    pageTransitionsTheme: const PageTransitionsTheme(),
    scrollbarTheme: const ScrollbarThemeData(),
    useMaterial3: true,
    brightness: Brightness.dark,
    canvasColor: Colors.white,
    cardColor: Colors.amber,
    colorScheme: null,
    colorSchemeSeed: null,
    dialogBackgroundColor: null,
    disabledColor: null,
    dividerColor: null,
    focusColor: null,
    highlightColor: null,
    hintColor: null,
    hoverColor: null,
    indicatorColor: null,
    primaryColor: null,
    primaryColorDark: null,
    primaryColorLight: null,
    primarySwatch: null,
    scaffoldBackgroundColor: null,
    secondaryHeaderColor: null,
    shadowColor: null,
    splashColor: null,
    unselectedWidgetColor: null,
    fontFamily: null,
    fontFamilyFallback: null,
    package: null,
    iconTheme: null,
    primaryIconTheme: null,
    primaryTextTheme: null,
    textTheme: null,
    typography: null,
    actionIconTheme: null,
    appBarTheme: null,
    badgeTheme: null,
    bannerTheme: null,
    bottomAppBarTheme: null,
    bottomNavigationBarTheme: null,
    bottomSheetTheme: null,
    buttonBarTheme: null,
    buttonTheme: null,
    cardTheme: null,
    checkboxTheme: null,
    chipTheme: null,
    dataTableTheme: null,
    datePickerTheme: null,
    dialogTheme: null,
    dividerTheme: null,
    drawerTheme: null,
    dropdownMenuTheme: null,
    elevatedButtonTheme: null,
    expansionTileTheme: null,
    filledButtonTheme: null,
    floatingActionButtonTheme: null,
    iconButtonTheme: null,
    listTileTheme: null,
    menuBarTheme: null,
    menuButtonTheme: null,
    menuTheme: null,
    navigationBarTheme: null,
    navigationDrawerTheme: null,
    navigationRailTheme: null,
    outlinedButtonTheme: null,
    popupMenuTheme: null,
    progressIndicatorTheme: null,
    radioTheme: null,
    searchBarTheme: null,
    searchViewTheme: null,
    segmentedButtonTheme: null,
    sliderTheme: null,
    snackBarTheme: null,
    switchTheme: null,
    tabBarTheme: null,
    textButtonTheme: null,
    textSelectionTheme: null,
    timePickerTheme: null,
    toggleButtonsTheme: null,
    tooltipTheme: null,
  );
}
