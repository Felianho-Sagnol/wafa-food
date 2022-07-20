// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:wafaeats/app/core/constants/app.palette.colors.dart';
import 'package:wafaeats/app/core/helpers/forms/forms.helpers.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;
  bool isGointToForPassword = false;
  int registeringSteps = 1;
  double formFieldButtomMargin = 8;

  String errorMessage = "";

  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 50, left: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Bienvenus sur ",
                          style: TextStyle(
                            fontSize: 23,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? "Wafa Food" : "Wafa Food",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "S'enregister pour continuer"
                          : "Se connecter pour continuer",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            // top: isSignupScreen ? 200 : 230,
            top: isSignupScreen ? 120 : 150,

            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              // height: isSignupScreen ? 380 : 280/360,280,
              height: isSignupScreen ? 360 : 280,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (() => changeIsSignupScreenPropertie(false)),
                          child: Column(
                            children: [
                              Text(
                                "Se connecter",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      !isSignupScreen && !isGointToForPassword
                                          ? Palette.activeColor
                                          : Palette.textColor1,
                                ),
                              ),
                              if (!isSignupScreen && !isGointToForPassword)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 90,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        if (!isGointToForPassword)
                          GestureDetector(
                            onTap: (() => changeIsSignupScreenPropertie(true)),
                            child: Column(
                              children: [
                                Text(
                                  "S'enregister",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 82,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                        if (isGointToForPassword)
                          GestureDetector(
                            onTap: (() => changeIsSignupScreenPropertie(true)),
                            child: Column(
                              children: [
                                Text(
                                  "Mot de passe",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: isGointToForPassword
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (isGointToForPassword)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 95,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          )
                      ],
                    ),
                    if (isSignupScreen && !isGointToForPassword)
                      buildSignupSection(),
                    if (!isSignupScreen && !isGointToForPassword)
                      buildSigninSection(),
                    if (isGointToForPassword) buildForgotPasswordSection(),
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text(
                    isSignupScreen
                        ? "Ou s'enregister avec"
                        : "Ou se connecter avec",
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTextButton(
                          1,
                          "Facebook",
                          Palette.facebookColor,
                        ),
                        buildTextButton(
                          2,
                          "Google",
                          Palette.googleColor,
                        ),
                        // buildTextButton(
                        //     Icon(SvgPicture.asset("assets/icons/heart.svg")),
                        //     "Google",
                        //     Palette.googleColor),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: buildInputDecoration(
                Icons.email,
                "Email",
              ),
              cursorColor: Palette.textColor1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 1.0),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: buildInputDecoration(
                Icons.lock_outline,
                "Mot de passe",
              ),
              cursorColor: Palette.textColor1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text(
                    "Se souvenir de moi",
                    style: TextStyle(
                      fontSize: 11,
                      color: Palette.textColor1,
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: (() => goingToForgotPassword()),
                child: Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(
                    fontSize: 11,
                    color: Palette.textColor1,
                  ),
                ),
              )
            ],
          ),
          if (errorMessage.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                errorMessage,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red.shade200,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          if (registeringSteps == 1) ...[
            Padding(
              padding: EdgeInsets.only(bottom: formFieldButtomMargin),
              child: TextField(
                controller: fullnameController,
                keyboardType: TextInputType.text,
                decoration: buildInputDecoration(
                  Icons.person_outline,
                  "Prénom & nom",
                ),
                cursorColor: Palette.textColor1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: formFieldButtomMargin),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.text,
                decoration: buildInputDecoration(
                  Icons.phone,
                  "Téléphone",
                ),
                cursorColor: Palette.textColor1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: formFieldButtomMargin),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: buildInputDecoration(
                  Icons.email,
                  "Email",
                ),
                cursorColor: Palette.textColor1,
              ),
            ),
            buildStepsButtons(),
          ],
          if (registeringSteps == 2) ...[
            Padding(
              padding: EdgeInsets.only(bottom: formFieldButtomMargin),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: buildInputDecoration(
                  Icons.lock_outline,
                  "Mot de passe",
                ),
                cursorColor: Palette.textColor1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: buildInputDecoration(
                  Icons.lock_outline,
                  "Confirmer",
                ),
                cursorColor: Palette.textColor1,
              ),
            ),
            buildStepsButtons(),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "En envoyant ces informations , vous acceptez nos ",
                    style: TextStyle(color: Palette.textColor2),
                    children: [
                      TextSpan(
                        //recognizer: ,
                        text: "termes & conditions",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ]),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Container buildForgotPasswordSection() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: buildInputDecoration(
                Icons.email,
                "Email",
              ),
              cursorColor: Palette.textColor1,
            ),
          ),
          Container(
            //width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Entrer votre adresse email pour récuperer",
                  style: TextStyle(color: Palette.textColor2),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: "  votre mot de passe.",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(
    int type,
    String title,
    Color backgroundColor,
  ) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        side: BorderSide(width: 1, color: Colors.grey),
        minimumSize: Size(145, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        primary: Colors.white,
        backgroundColor: backgroundColor,
      ),
      child: Row(
        children: [
          if (type == 1) Icon(Icons.facebook),
          if (type == 2)
            Image.asset(
              'assets/google.png',
              height: 24,
              width: 24,
              //color: backgroundColor,
            ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      // top: isSignupScreen ? 455 : 380,,
      top: isSignupScreen ? 435 : 380,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange[200]!, Colors.red[400]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        )
                      ]),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
              : Center(),
        ),
      ),
    );
  }

  Widget buildTextField(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }

  Padding buildStepsButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              //</style>
              if (registeringSteps < 2) {
                _increaseRegisteringSteps();
              } else {
                _decreaseRegisteringSteps();
              }
            },
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Palette.textColor2,
                    border: Border.all(
                      width: 1,
                      color: isMale ? Colors.transparent : Palette.textColor1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    (registeringSteps < 2)
                        ? Icons.arrow_forward
                        : Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Text(
                  (registeringSteps < 2) ? "Suivant" : "Retour",
                  style: TextStyle(color: Palette.textColor1),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildChoiceButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: isMale ? Palette.textColor2 : Colors.transparent,
                      border: Border.all(
                          width: 1,
                          color:
                              isMale ? Colors.transparent : Palette.textColor1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    Icons.person_outline,
                    color: isMale ? Colors.white : Palette.iconColor,
                  ),
                ),
                Text(
                  "Male",
                  style: TextStyle(color: Palette.textColor1),
                )
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: isMale ? Colors.transparent : Palette.textColor2,
                      border: Border.all(
                          width: 1,
                          color:
                              isMale ? Palette.textColor1 : Colors.transparent),
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    Icons.person_outline,
                    color: isMale ? Palette.iconColor : Colors.white,
                  ),
                ),
                Text(
                  "Female",
                  style: TextStyle(color: Palette.textColor1),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void changeIsSignupScreenPropertie(bool value) {
    setState(() {
      isSignupScreen = value;
      isGointToForPassword = false;
    });
  }

  void goingToForgotPassword() {
    setState(() {
      isGointToForPassword = true;
    });
  }

  void _increaseRegisteringSteps() {
    setState(() {
      registeringSteps++;
    });
  }

  void _decreaseRegisteringSteps() {
    setState(() {
      registeringSteps--;
    });
  }

  void setErrorMessage(String message) {
    setState(() {
      errorMessage = message;
    });
  }

  bool firstStepValidaton() {
    if (!EmailValidator.validate(emailController.text)) {
      setErrorMessage("Adresse email invalide");
      return false;
    }
    return true;
  }
}
