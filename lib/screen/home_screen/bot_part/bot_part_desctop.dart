import 'dart:html';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:www/img.dart';

class BotPartDesctop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 100,
          width: 200,
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
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
        ),
        SizedBox(height: 30),
        Row(mainAxisSize: MainAxisSize.min, children: [
          CircularProfileAvatar(
            '',
            child: Center(
                child: Text("1",
                    style: TextStyle(fontSize: 28, color: Colors.white))),
            borderColor: Colors.red,
            backgroundColor: Colors.redAccent,
            borderWidth: 5,
            elevation: 2,
            radius: 35,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Wybierz oferte",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Wybierz specjalistę, dobierz wygodną formę\n rozmowy i dokonaj płatności.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  )),
            ],
          ),
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(Img.howItWork1),
          )
        ]),
        Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(Img.howItWork2),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Odbierz maila",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Jeżeli wybrałeś połączenie wideo, sprawdź skrzynkę\n mailową, dostaniesz zaproszenie do rozmowy w formie\n linku.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Jeżeli wybrałeś rozmowę telefoniczną, oczekuj na kontakt\n ze strony lekarza",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  )),
            ],
          ),
          CircularProfileAvatar(
            '',
            child: Center(
                child: Text("2",
                    style: TextStyle(fontSize: 28, color: Colors.white))),
            borderColor: Colors.red,
            backgroundColor: Colors.redAccent,
            borderWidth: 5,
            elevation: 2,
            radius: 35,
          ),
        ]),
        Row(mainAxisSize: MainAxisSize.min, children: [
          CircularProfileAvatar(
            '',
            child: Center(
                child: Text("3",
                    style: TextStyle(fontSize: 28, color: Colors.white))),
            borderColor: Colors.red,
            backgroundColor: Colors.redAccent,
            borderWidth: 5,
            elevation: 2,
            radius: 35,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Opisz problem",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Przedstaw lekarzowi swój problem,\na następnie zastosuj się do jego zaleceń.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  )),
            ],
          ),
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(Img.howItWork3),
          )
        ]),
      ],
    );
  }
}
