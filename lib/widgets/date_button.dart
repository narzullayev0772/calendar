import 'package:flutter/material.dart';

class DateButton extends StatefulWidget {
  const DateButton({super.key, required this.callback});

  final Function(DateTime) callback;

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  final DateTime firstDate =
      DateTime.now().subtract(const Duration(days: 365 * 10));
  final DateTime lastDate = DateTime.now().add(const Duration(days: 365 * 10));

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        DateTime? selectedTime = await showDatePicker(
          context: context,
          firstDate: firstDate,
          lastDate: lastDate,
          initialEntryMode: DatePickerEntryMode.calendar,
          initialDatePickerMode: DatePickerMode.year,
        );
        if (selectedTime != null) {
          widget.callback(selectedTime);
        }
      },
      child: const Text(
        "January 2022",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
