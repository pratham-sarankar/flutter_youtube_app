import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/core/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/navigation/routes.dart';
import 'features/feed/presentation/pages/feed_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() async {
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
        Routes.feed: (context) => const FeedScreen(),
      },
    );
  }
}
