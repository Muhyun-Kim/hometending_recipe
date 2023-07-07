import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hometending_recipe/views/components/wrapper/auth_wrapper.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.sawarabiGothicTextTheme(),
        ),
        home: const Scaffold(
          body: AuthWrapper(),
        ));
  }
}
