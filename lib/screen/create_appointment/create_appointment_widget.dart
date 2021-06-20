import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:www/api.dart';
import 'package:www/models/appointment.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:www/routes/route.dart';
import 'package:www/show_toast.dart';

class CreateAppointmentWidget extends StatefulWidget {
  Appointment appointment = Appointment();
  CreateAppointmentWidget();

  @override
  State<StatefulWidget> createState() => _CreateAppointmentWidget();
}

class _CreateAppointmentWidget extends State<CreateAppointmentWidget> {
  String selectedSlot;
  bool _isLoading = false;
  DateTime selectedDate;
  List<String> slots = List();
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    this._getSlots();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: DatePicker(DateTime.now(),
              initialSelectedDate: selectedDate,
              selectionColor: Colors.black,
              selectedTextColor: Colors.white, onDateChange: (date) {
            setState(() {
              slots.clear();
              _getSlots();
              selectedDate = date;
            });
          })),
      !_isLoading
          ? Expanded(
              child: Container(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListView.builder(
                itemCount: slots.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildListTile(slots[index]);
                },
              ),
            ))
          : Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                  Center(
                      child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                    ),
                  ))
                ])),
      SizedBox(
        height: 20,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          primary: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(color: Colors.red, width: 2)),
        ),
        onPressed: _createAppointment,
        child: AutoSizeText(
          'Umów wizyte',
          maxFontSize: 30,
          style: TextStyle(
              fontSize: 30,
              color: Colors.red,
              backgroundColor: Colors.transparent),
          maxLines: 1,
        ),
      ),
    ]);
  }

  Widget _buildListTile(String slot) {
    final alreadySaved =
        selectedSlot != null && selectedSlot.compareTo(slot) == 0
            ? true
            : false;
    return Card(
        child: ListTile(
      title: Text(slot),
      trailing: Icon(
        alreadySaved ? Icons.check : null,
        color: alreadySaved ? Colors.green : null,
      ),
      onTap: () {
        setState(() {
          if (selectedSlot == slot)
            selectedSlot = null;
          else
            selectedSlot = slot;
        });
      },
    ));
  }

  void _getSlots() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      List<String> resSlots = await ApiProvider()
          .getSlots(dateTime: selectedDate, context: context);
      if (!mounted) return;
      if (resSlots != null) {
        setState(() {
          slots.addAll(resSlots);
        });
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _createAppointment() async {
    if (selectedSlot == null) {
      showToast("Nie wybrano terminu", Colors.black, Colors.red);
      return;
    }
    widget.appointment.appointmentDate =
        selectedDate.toString().split(' ')[0] + ' ' + selectedSlot;

    Appointment appointment = await ApiProvider()
        .createAppointment(context: context, appointment: widget.appointment);
    if (appointment != null) {
      Navigator.of(context).pushNamed(Routes.myAccount);
    }
    if (!mounted) return;
  }
}
