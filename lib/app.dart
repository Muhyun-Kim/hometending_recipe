import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        textTheme: GoogleFonts.sawarabiGothicTextTheme(),
      ),
      routerConfig: router,
    );
  }
}
