import 'package:flutter/material.dart';

class TopPartMobile extends StatelessWidget {
  const TopPartMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
        ),
        Text(
          "Wygodne i szybkie konsultacje\n z lekarzem weterynaryjnym",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Text(
            "W trosce o zdrowie naszych\nczworonożnych podopiecznych",
            style: TextStyle(
                color: Colors.red, fontSize: 8, fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "O nas",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Column(
            children: [
              Text(
                "Serwis weterynarz.online powstał w\ntrosce o zdrowie naszych czworonożnych\npodopiecznych.",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Czasami znajdujemy się w trudnym\npołożeniu i potrzebujemy opinii specjalisty,\nby nadać odpowiedni kierunek naszym\ndziałaniom.",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Chcąc nieść pomoc zarówno zwierzętom,\njak i ich właścicielom, umożliwiamy\nnatychmiastową konsultację\nz lekarzami weterynarii!",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
