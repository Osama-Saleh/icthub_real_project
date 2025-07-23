import 'package:flutter/material.dart';
import 'package:icthubproject/feature/home_screen/ui/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'feature/sing_up/ui/sing_up_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://kmrldaguygooqlkenbit.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImttcmxkYWd1eWdvb3Fsa2VuYml0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMyODkzMjcsImV4cCI6MjA2ODg2NTMyN30.fnZ85iasPlheOnthsFcm1SreuRJEzQm5Jur36xoVDKk',
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final supabase = Supabase.instance.client;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:supabase.auth.currentUser==null ? SingUpScreen() : HomeScreen(),
    );
  }
}

