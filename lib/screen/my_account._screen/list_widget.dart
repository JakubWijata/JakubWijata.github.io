import 'package:flutter/material.dart';
import 'package:www/img.dart';
import 'package:www/services/user_info.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  String dogName = "Buka";
  String rasa = "Bernańczyk";
  String wiek = "10";
  String wizytaTermin = "25.01.2021 14:50";

  @override
  void initState() {
    _downloadInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserInfo>();
    return Column(
      children: [
        dogCard(),
        calendarCard(),
        profileCard(userInfo.user.email),
      ],
    );
  }

  Widget dogCard() {
    return Card(
      color: Color(0xF0FFFFFF),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[600], width: 2.0),
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Row(
          children: [
            Image(
              image: AssetImage(Img.dog),
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${dogName}",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Rasa: ${rasa}",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Wiek: ${wiek} lat",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 18,
                    ),
                    primary: Colors.redAccent,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('szczegóły'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget calendarCard() {
    return Card(
      color: Color(0xF0FFFFFF),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[600], width: 2.0),
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Row(
          children: [
            Image(
              image: AssetImage(Img.calendar),
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Najbliższa wizyta",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "${wizytaTermin}",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget profileCard(String email) {
    return Card(
      color: Color(0xF0FFFFFF),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[600], width: 3.0),
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Row(
          children: [
            Image(
              image: AssetImage(Img.profil),
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${email}",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _downloadInfo() {
    setState(() {});
  }
}
