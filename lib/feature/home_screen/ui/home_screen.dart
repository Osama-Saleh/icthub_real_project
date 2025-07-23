import 'package:flutter/material.dart';
import 'package:icthubproject/feature/sing_up/ui/sing_up_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home Screen"),
          ElevatedButton(onPressed: () async{
            await Supabase.instance.client.auth.signOut();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SingUpScreen(),), (route) => false,);

          }, child: Text('SignOut'))
        ],
      ),),
    );
  }
}