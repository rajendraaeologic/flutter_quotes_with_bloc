import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/cubit/quote_state.dart';
import 'package:quotes_app/ui/quote_screen.dart';

import 'di/app_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initGetIt();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark));
  runApp(MultiBlocProvider(providers: [BlocProvider<QuoteCubit>(create: (context) => QuoteCubit())], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.oswaldTextTheme(textTheme).copyWith(
              headline1: GoogleFonts.oswald(),
              headline2: GoogleFonts.abel(),
              headline3: GoogleFonts.catamaran(),
            ),
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              brightness: Brightness.dark,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              textTheme: TextTheme(),
            )),
        home: QuoteScreen(),
      ),
    );
  }
}
