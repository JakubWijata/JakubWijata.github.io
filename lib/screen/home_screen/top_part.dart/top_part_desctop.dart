import 'package:flutter/material.dart';
import 'package:www/img.dart';

class TopPartDesctop extends StatelessWidget {
  const TopPartDesctop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 1735,
          child: Image.asset(
            Img.back1,
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 400,
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Container(
                      height: 1335,
                      width: 600,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(top: 300),
                        child: new Container(
                          decoration: new BoxDecoration(
                            color: Colors.red[100],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 400, left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Serwis weterynarz.online powstał w\ntrosce o zdrowie naszych czworonożnych\npodopiecznych.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Czasami znajdujemy się w trudnym\npołożeniu i potrzebujemy opinii specjalisty,\nby nadać odpowiedni kierunek naszym\ndziałaniom.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Chcąc nieść pomoc zarówno zwierzętom,\njak i ich właścicielom, umożliwiamy\nnatychmiastową konsultację\nz lekarzami weterynarii!",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    Container(
                      height: 600,
                      width: 600,
                      color: Colors.transparent,
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(const Radius.circular(400.0)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, top: 230),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wygodne i szybkie konsultacje\n z lekarzem weterynaryjnym",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.normal),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child: Text(
                                  "W trosce o zdrowie naszych\nczworonożnych podopiecznych",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 150, top: 60),
                                child: Text(
                                  "O nas",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 160, top: 10),
                                child: Text(
                                  "Poznaj nas troszkę lepiej",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
