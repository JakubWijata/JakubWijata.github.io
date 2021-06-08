import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:www/api.dart';
import 'package:www/models/user_register.dart';
import 'package:www/routes/route.dart';
import 'package:www/validator.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  String emailError = null;
  String passwordError = null;
  String passwordRepError = null;

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
                'Zarejestruj się',
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
                      'Imie',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        focusColor: Colors.green,
                        fillColor: Colors.green,
                        border: OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Wprowadz imie',
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
                      'Nazwisko',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        focusColor: Colors.green,
                        fillColor: Colors.green,
                        border: OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Wprowadz Nazwisko',
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
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Powtórz haslo',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      controller: passwordRepController,
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: passwordRepError,
                        focusColor: Colors.green,
                        fillColor: Colors.green,
                        border: OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Powtórz haslo',
                      ),
                    ),
                  )
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
                        onPressed: register,
                        child: AutoSizeText(
                          'Zarejestruj się',
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
                    'Masz konto? ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54),
                  ),
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.login);
                    },
                    child: Text(
                      'Zaloguj się',
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

  Future<void> register() async {
    emailError = null;
    passwordError = null;
    passwordRepError = null;
    bool tryRegister = true;

    print(emailController.text);
    if (emailController.text.isEmpty) {
      emailError = "wprowadz email";
      tryRegister = false;
    } else if (!Validator.emialIsCorrect(emailController.text)) {
      emailError = "Niepoprawny email";
      tryRegister = false;
    }

    if (passwordController.text.isEmpty) {
      passwordError = "wprowadz hasło";
      tryRegister = false;
    } else if (!Validator.passwordIsCorrect(passwordController.text)) {
      passwordError = "Niepoprawny hasło";
      tryRegister = false;
    }

    if (passwordRepController.text.isEmpty) {
      passwordRepError = "wprowadz hasło";
      tryRegister = false;
    } else if (!Validator.passwordIsCorrect(passwordRepController.text)) {
      passwordRepError = "Niepoprawny hasło";
      tryRegister = false;
    } else if (passwordRepController.text.compareTo(passwordController.text) !=
        0) {
      passwordRepError = "hasła nie są takie same";
      passwordError = "hasła nie są takie same";
      tryRegister = false;
    }

    if (tryRegister) {
      bool user = await ApiProvider().register(
          UserRegister(
              password: passwordController.text,
              passwordConfirm: passwordRepController.text,
              email: emailController.text,
              firstName: nameController.text,
              lastName: lastNameController.text,
              accountType: "patient"),
          context);
      if (user) Navigator.of(context).pushNamed(Routes.petForm);
    }
    setState(() {});
  }
}
