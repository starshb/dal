import 'package:deliciousdal/common/view/root_tab.dart';
import 'package:deliciousdal/common/view/splash_screen.dart';
import 'package:deliciousdal/user/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://vepjengucoxqwdtwtfxi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZlcGplbmd1Y294cXdkdHd0ZnhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEyMTU3MzYsImV4cCI6MjAwNjc5MTczNn0.7AsY9YQvPfFxZLegobq9h6z75POZf0Ya9jo2k9lTtZQ',
  );
  AuthRepository.initialize(
      appKey: 'b9c16b8c42126a715d8a9273fe4a48f2'); //카카오맵 위한 js키
  runApp(
    _App(),
  );
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Nanum',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
