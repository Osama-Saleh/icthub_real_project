import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:icthubproject/core/validator/validator.dart';
import 'package:icthubproject/core/widgets/custom_text_form_filed.dart';
import 'package:icthubproject/feature/sing_in/ui/sing_in_screen.dart';
import 'package:icthubproject/feature/sing_up/data_source/sing_up_data_source_imple.dart';

class SingUpScreen extends StatefulWidget {
  SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  TextEditingController? emailController = TextEditingController();

  TextEditingController? passController = TextEditingController();
  var singUpFormKey = GlobalKey<FormState>();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: singUpFormKey,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                child: Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 380,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sing Up",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFormFiled(
                            controller: emailController,
                            labelText: "Email",
                            hintText: 'Enter your email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            validator: (value) => CustomValidator.emailValidator(value: value),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFormFiled(
                            controller: passController,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                            ),
                            obscureText: isObscure,
                            validator:(value) =>  CustomValidator.passValidator(value: value),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  if (singUpFormKey.currentState!.validate()) {
                                    SingUpDataSourceImple.SignUp(
                                        email: emailController!.text,
                                        password: passController!.text,
                                        context: context,
                                        );
                                  }
                                },
                                child: Text(
                                  'Sing Up',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already Have An Account?',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SingInScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: Text(
                                    'Sing In',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
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
