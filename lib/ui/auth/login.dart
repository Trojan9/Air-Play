import 'package:Airplay/ui/auth/forgottenpassword.dart';
import 'package:Airplay/ui/auth/signup.dart';
import 'package:Airplay/ui/dashboard/home.dart';
import 'package:Airplay/ui/dashboard/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:Airplay/utils/buttons/custom_button.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/utils/validation.dart';
import 'package:Airplay/widget/textform/customtextform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final _firstNameController = TextEditingController();
  // final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor2,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Column(
              children: [
                verticalSpaceLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("Airplay",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                verticalSpaceMedium,
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Let’s sign you in.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: backgroundcolor1),
                    )),
                verticalSpaceMedium,
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Welcome back, we’ve missed you.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: backgroundcolor1),
                    )),
                verticalSpaceMedium,
                CustomTextField(
                  hintText: 'Email Address or Phone Number',
                  title: 'Email',
                  maxLines: 1,
                  controller: _emailController,
                  validator: (val) => Validate.validateEmail(val),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                CustomTextField(
                  hintText: 'Input Password',
                  title: 'Input Password',
                  maxLines: 1,
                  controller: _passwordController,
                  validator: (val) => Validate.validateEmail(val),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(TextSpan(
                      text: 'Don’t have an account?  ',
                      style: TextStyle(
                        fontSize: 14,
                        color: regular,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const SignUp()));
                              },
                            text: 'Sign up ',
                            style: const TextStyle(
                              color: Colors.white,
                              //decoration: TextDecoration.underline,
                            )),
                      ])),
                ),
                verticalSpaceLarge,
                verticalSpaceLarge,
                CustomButton(
                  title: 'Login you in...',
                  text_in: "Sign In",
                  fontSize: 13,
                  height: 50,
                  busy: false,
                  buttonColor: const Color.fromRGBO(2, 53, 60, 1),
                  onPressed: () {
                    // final Map<String, String> data = {
                    //   "email": _emailController.text,
                    //   "password": _passwordController.text
                    // };
                    // if (_formKey.currentState.validate()) {
                    //   print(data);
                    //   model.loginUser(data);
                    // }
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const NavBar()));
                  },
                  borderColor: const Color.fromRGBO(2, 53, 60, 1),
                  newWidget: null,
                  width: MediaQuery.of(context).size.width / 2.5,
                ),
                verticalSpaceLarge,
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(TextSpan(
                      text: 'Forgot Password?  ',
                      style: TextStyle(
                        fontSize: 14,
                        color: regular,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const ForgottenPass()));
                              },
                            text: 'Click here ',
                            style: const TextStyle(
                              color: Colors.white,
                              //decoration: TextDecoration.underline,
                            )),
                      ])),
                ),
                verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/1.png",
                      ),
                    ),
                    InkWell(onTap: () {}, child: Image.asset("assets/2.png")),
                    InkWell(onTap: () {}, child: Image.asset("assets/3.png")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
