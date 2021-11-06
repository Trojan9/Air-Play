import 'package:Airplay/ui/auth/login.dart';
import 'package:Airplay/utils/buttons/custom_button.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/utils/validation.dart';
import 'package:Airplay/widget/textform/customtextform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // final _firstNameController = TextEditingController();
  // final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    child: Text(
                      "Airplay",
                      style: GoogleFonts.montserrat(
                        color: (Theme.of(context).textTheme.bodyText1!.color)!,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                verticalSpaceMedium,
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Let’s get you started.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: (Theme.of(context).textTheme.bodyText1!.color)!,
                      ),
                    )),
                verticalSpaceMedium,
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Welcome to Airplay, we offer the best service for audio.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: (Theme.of(context).textTheme.bodyText1!.color)!,
                      ),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                CustomTextField(
                  hintText: 'Retype Password',
                  title: 'Retype Password',
                  maxLines: 1,
                  controller: _repasswordController,
                  validator: (val) => Validate.validateEmail(val),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account?  ',
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
                                      const Login(),
                                ),
                              );
                            },
                          text: 'Sign in ',
                          style: TextStyle(
                            color:
                                (Theme.of(context).textTheme.bodyText1!.color)!,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // verticalSpaceMedium,
                // verticalSpaceMedium,
                Spacer(),
                CustomButton(
                  title: 'Login you in...',
                  text_in: "Sign Up",
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
                  },
                  borderColor: const Color.fromRGBO(2, 53, 60, 1),
                  newWidget: null,
                  width: MediaQuery.of(context).size.width / 2.5,
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
                ),
                verticalSpaceLarge,
                verticalSpaceLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
