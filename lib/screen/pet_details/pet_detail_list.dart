import 'package:flutter/material.dart';
import 'package:www/services/user_info.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PetDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserInfo>();

    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Najważniejsz informacjie o Twoim pupilu ',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: Colors.red),
              ),
              SizedBox(height: 50),
              if (userInfo.pet.name != null)
                formRow(
                    "Imie", TextEditingController(text: userInfo.pet.name), 1),
              SizedBox(height: 20),
              if (userInfo.pet.breed != null)
                formRow(
                    "Rasa", TextEditingController(text: userInfo.pet.breed), 1),
              if (userInfo.pet.breed != null) SizedBox(height: 20),
              if (userInfo.pet.date_of_birth != null)
                formRow(
                    "Data urodzenia",
                    TextEditingController(
                        text: userInfo.pet.date_of_birth.split('T')[0]),
                    1),
              if (userInfo.pet.date_of_birth != null) SizedBox(height: 20),
              if (userInfo.pet.sex != null)
                formRow(
                    "Płeć", TextEditingController(text: userInfo.pet.sex), 1),
              if (userInfo.pet.sex != null) SizedBox(height: 20),
              if (userInfo.pet.marks != null)
                formRow("Znaki szczególne",
                    TextEditingController(text: userInfo.pet.marks), 1),
              if (userInfo.pet.marks != null) SizedBox(height: 20),
            ],
          ),
        ));
  }

  Widget formRow(String title, TextEditingController cotroller, int lines) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
                color: Colors.black54),
          ),
        ),
        Flexible(
          flex: 2,
          child: TextField(
            maxLines: lines,
            readOnly: true,
            controller: cotroller,
            decoration: InputDecoration(
              focusColor: Colors.green,
              fillColor: Colors.green,
              border: OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
