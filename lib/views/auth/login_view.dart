import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Image.asset(
        "assets/pro.png",
        height: mq.size.height / 4,
        width: mq.size.width / 1.5,
      ),
    );

    final emailField = TextFormField(
      enabled: !isSubmitted,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: "youremail@example.com",
        labelText: "Email",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );

    final passwordField = TextFormField(
      enabled: !isSubmitted,
      controller: _passwordController,
      style: const TextStyle(
        color: Colors.white,
      ),
      obscureText: true,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: "password",
        labelText: "Password",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );

    final forgotPassword = Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MaterialButton(
            child: Text(
              "Forgot Password",
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
            ),
            onPressed: () {
              // ignore: avoid_print
              print("Forgot Password Pressed");
            },
          ),
        ],
      ),
    );

    final fields = Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          emailField,
          passwordField,
          forgotPassword,
        ],
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          // Handle Authentication
          Navigator.of(context).pushNamed(AppRoutes.productList);
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        const Padding(
          padding: EdgeInsets.all(8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Not a Member ?",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                  ),
            ),
            MaterialButton(
              child: Text(
                "Sign Up",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.register);
              },
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.amber[900],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(36),
          child: SizedBox(
            height: mq.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                logo,
                fields,
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: (bottom),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
