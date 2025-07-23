import 'package:flutter/material.dart';
import 'package:icthubproject/feature/home_screen/ui/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInDataSourceImple {
  static final supabase = Supabase.instance.client;

 static Future SingIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (res.user != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Success'),
             backgroundColor: Colors.green,
            ));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error'),
             backgroundColor: Colors.red,
            ));
      }
    } catch (e) {
      if(e is AuthApiException){

      ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error ${e.message}'),
             backgroundColor: Colors.red,
            ));
      }
      print(e);
    }
  }
}
