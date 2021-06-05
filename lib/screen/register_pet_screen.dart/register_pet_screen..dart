import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:www/img.dart';
import 'package:www/screen/widget/drawer/navigation_drawer.dart';
import 'package:www/screen/widget/navigation_bar/navigation_bar.dart';
import 'package:www/screen/widget/pet_form.dart';

class RegisterPetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        body: Stack(children: [
          ListView(
            children: [
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: AspectRatio(
                      aspectRatio: 10 / 16,
                      child: Image(
                        image: AssetImage(Img.loginCat),
                        fit: BoxFit.fill, // use this
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: PetForm(),
                    ),
                    flex: 4,
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
          NavigationBar(),
        ]));
  }
}
