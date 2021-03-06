import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:www/api.dart';
import 'package:www/models/user.dart';
import 'package:www/models/user_login.dart';
import 'package:www/routes/route.dart';
import 'package:www/validator.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String emailError = null;
  String passwordError = null;
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 40),
          child: Column(
            children: [
              Text(
                'Zaloguj się',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.black54),
              ),
              SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        errorText: emailError,
                        focusColor: Colors.green,
                        fillColor: Colors.green,
                        border: OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Wprowadz Email',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Hasło',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        errorText: passwordError,
                        focusColor: Colors.green,
                        fillColor: Colors.green,
                        border: OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Wprowadz haslo',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Spacer(),
                  Flexible(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: _checkbox,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              _checkbox = !_checkbox;
                            });
                          },
                        ),
                        Text(
                          'Zapamiętaj mnie',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Row(
                children: [
                  Spacer(flex: 2),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        onPressed: logIn,
                        child: AutoSizeText(
                          'Zaloguj',
                          maxFontSize: 30,
                          style: TextStyle(fontSize: 30),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nie masz konta? ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54),
                  ),
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.register);
                    },
                    child: Text(
                      'Załóż konto',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Future<void> logIn() async {
    emailError = null;
    passwordError = null;
    bool tryLogin = true;

    print(emailController.text);
    if (emailController.text.isEmpty) {
      emailError = "wprowadz email";
      tryLogin = false;
    } else if (!Validator.emialIsCorrect(emailController.text)) {
      emailError = "Niepoprawny email";
      tryLogin = false;
    }

    if (passwordController.text.isEmpty) {
      passwordError = "wprowadz hasło";
      tryLogin = false;
    } else if (!Validator.passwordIsCorrect(passwordController.text)) {
      passwordError = "Niepoprawny hasło";
      tryLogin = false;
    }

    if (tryLogin) {
      User user = await ApiProvider().login(
          UserLogin(
              email: emailController.text, password: passwordController.text),
          context);
      if (user != null) {
        Navigator.of(context).pushReplacementNamed(Routes.myAccount);
      }
    }
    setState(() {});
  }
}
