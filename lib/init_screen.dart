import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  bool? isAdmin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 20),
        child: Column(
          spacing: 30,
          children: [

            Expanded(
              child: InkWell(
                onTap: (){
                  setState(() {
                    isAdmin = true;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color:isAdmin==true ? Colors.green : Colors.white,width: 2),
                      boxShadow: [
                        BoxShadow(
                          color:isAdmin==true ? Colors.green : Colors.white,
                          blurRadius:isAdmin == true ? 10 : 0,
                        ),
                      ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: Lottie.asset('assets/lotti/admin.json'),
                          ),
                          Text("Admin",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  setState(() {
                    isAdmin = false;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color:isAdmin==false ? Colors.green : Colors.white,width: 2),
                      boxShadow: [
                        BoxShadow(
                          color:isAdmin==false ? Colors.green : Colors.white,
                          blurRadius:isAdmin==false ? 10 : 0,
                        ),
                      ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: Lottie.asset('assets/lotti/User.json'),
                          ),
                          Text("User",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
