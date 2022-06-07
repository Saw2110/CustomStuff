import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
import 'package:nepali_date_picker/nepali_date_picker.dart';

class CalenderScreen extends StatelessWidget {
  CalenderScreen({Key? key}) : super(key: key);

  final ValueNotifier<NepaliDateTime> _selectedDate =
      ValueNotifier(NepaliDateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text("Calender")),
      body: Card(
        elevation: 2.0,
        color: Colors.grey.shade50,
        child: picker.CalendarDatePicker(
            initialDate: NepaliDateTime.now(),
            firstDate: NepaliDateTime(2070),
            lastDate: NepaliDateTime(2090),
            onDateChanged: (date) => _selectedDate.value = date,
            onDisplayedMonthChanged: (v) {},
            dayBuilder: (dayToBuild) {
              return Stack(children: <Widget>[
                Center(
                    child: Text(
                  '${dayToBuild.day}',
                  style: Theme.of(context).textTheme.caption,
                )),
              ]);
            }),
      ),
    );
  }
}
