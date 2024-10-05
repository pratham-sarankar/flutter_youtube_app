import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_youtube_app/core/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/navigation/routes.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const WiseTubeApp());
}

class WiseTubeApp extends StatelessWidget {
  const WiseTubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MaterialTheme(GoogleFonts.poppinsTextTheme()).light(),
      darkTheme: MaterialTheme(GoogleFonts.poppinsTextTheme()).dark(),
      routes: {
        Routes.home: (context) => const HomeScreen(),
      },
    );
  }
}
