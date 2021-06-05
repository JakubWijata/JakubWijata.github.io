import 'package:flutter/material.dart';
import 'package:www/routes/route.dart';

class PetForm extends StatefulWidget {
  @override
  _PetFormState createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final imieController = TextEditingController();
  final rasaController = TextEditingController();
  final plecController = TextEditingController();
  final dataController = TextEditingController();
  final mascController = TextEditingController();
  final znakiController = TextEditingController();
  final wagaController = TextEditingController();
  final uwagiController = TextEditingController();

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
                'Profil Pupila',
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
                      controller: imieController,
                      decoration: InputDecoration(
                        focusColor: Colors.green,
                        fillColor: Colors.green,
                        border: OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Wprowadz Imie',
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
                      'Rasa',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      controller: rasaController,
                      decoration: InputDecoration(
                        focusColor: Colors.green,
                        fillColor: Colors.green,
                        border: OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Wprowadz Rase',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              formRow(plecController, "Płeć", "Wprowadź Płeć", 1),
              SizedBox(height: 20),
              formRow(dataController, "Data urodzenia",
                  "Wprowadź Date urodzenia", 1),
              SizedBox(height: 20),
              formRow(mascController, "Maść", "Wprowadź Maść", 1),
              SizedBox(height: 20),
              formRow(znakiController, "Znaki szczególne",
                  "Wprowadź Znaki szczególne", 1),
              SizedBox(height: 20),
              formRow(wagaController, "Wage", "Wprowadź Wage", 1),
              SizedBox(height: 20),
              formRow(uwagiController, "Uwagi", "", 5),
              SizedBox(height: 60),
              Row(
                children: [
                  Spacer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 30,
                          ),
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        onPressed: registerPet,
                        child: Text('Stwórz Profil pupila'),
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
  }

  Future<void> registerPet() async {
    //     final imieController = TextEditingController();
    // final rasaController = TextEditingController();
    // final plecController = TextEditingController();
    // final dataController = TextEditingController();
    // final mascController = TextEditingController();
    // final znakiController = TextEditingController();
    // final wagaController = TextEditingController();
    // final uwagiController = TextEditingController();
    //TODO add call to appi registerPet
    Navigator.of(context).pushNamed(Routes.myAccount);

    setState(() {});
  }

  Widget formRow(TextEditingController controller, String title,
      String hintText, int lines) {
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
            controller: controller,
            decoration: InputDecoration(
              focusColor: Colors.green,
              fillColor: Colors.green,
              border: OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              ),
              hintText: hintText,
            ),
          ),
        )
      ],
    );
  }
}
