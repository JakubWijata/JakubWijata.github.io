import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:www/screen/create_appointment/create_appointment_widget.dart';

import '../../api.dart';

class CardAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height / 1.7,
              width: width / 3,
              child: CreateAppointmentWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
