import 'package:flutter/material.dart';
import 'package:www/img.dart';
import 'package:www/models/pet.dart';
import 'package:www/routes/route.dart';
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
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserInfo>();
    return Column(
      children: [
        dogCard(userInfo.pet),
        calendarCard(userInfo.appointmentsIsEmpty
            ? 'Brak nadchodzących wizyt'
            : userInfo.closelyAppointmentsDate),
        profileCard(userInfo.user.email),
      ],
    );
  }

  Widget dogCard(Pet pet) {
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
                  "${pet.name ??= ''}",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Rasa: ${pet.breed ??= ''}",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Data urodzenia: ${pet.date_of_birth != null ? pet.date_of_birth.toString()?.split("T")[0] : ''}",
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
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.pet);
                  },
                  child: Text('szczegóły'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget calendarCard(String text) {
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
                  "${text}",
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
}
