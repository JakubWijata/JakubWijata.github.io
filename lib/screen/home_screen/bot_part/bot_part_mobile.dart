import 'package:flutter/material.dart';

class BotPartMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          width: 100,
          color: Colors.transparent,
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.red[700],
              borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(100.0),
                  bottomRight: const Radius.circular(100.0)),
            ),
            child: Center(
                child: Text(
              "Jak to działa?",
              style: TextStyle(color: Colors.white, fontSize: 10),
            )),
          ),
        ),
        SizedBox(height: 30),
        Row(mainAxisSize: MainAxisSize.min, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("1. Wybierz oferte",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left),
              SizedBox(
                height: 10,
              ),
              Text(
                "Wybierz specjalistę, dobierz wygodną\nformę rozmowy i dokonaj płatności.",
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ]),
        SizedBox(height: 30),
        Row(mainAxisSize: MainAxisSize.min, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("2. Odbierz maila",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Jeżeli wybrałeś połączenie wideo, \nsprawdź skrzynkęmailową,\ndostaniesz zaproszenie do rozmowy w formie\nlinku.",
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Jeżeli wybrałeś rozmowę telefoniczną,\noczekuj na kontakt ze strony\nlekarza",
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left),
            ],
          ),
        ]),
        SizedBox(height: 30),
        Row(mainAxisSize: MainAxisSize.min, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("3. Opisz problem",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Przedstaw lekarzowi swój problem,\na następnie zastosuj się do jego\nzaleceń.",
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left),
            ],
          ),
        ]),
      ],
    );
  }
}
