import 'package:flutter/material.dart';
import '/bootstrap/app.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'bootstrap/boot.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://jlfiveitxrqneufcykrx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsZml2ZWl0eHJxbmV1ZmN5a3J4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU4Mjk5NjksImV4cCI6MjAxMTQwNTk2OX0.UyM2X6Fjq_pNukAAd1C8S0hsgIauCXBtEeyjtJhvs-g',
  );

  WidgetsFlutterBinding.ensureInitialized();
  Nylo nylo = await Nylo.init(setup: Boot.nylo, setupFinished: Boot.finished);

  runApp(
    AppBuild(
      navigatorKey: NyNavigator.instance.router.navigatorKey,
      onGenerateRoute: nylo.router!.generator(),
      debugShowCheckedModeBanner: false,
      initialRoute: nylo.getInitialRoute(),
    ),
  );
}
