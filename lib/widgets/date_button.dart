import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateButton extends StatefulWidget {
  const DateButton({super.key, required this.callback, required this.date});

  final Function(DateTime) callback;
  final DateTime date;

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  final DateTime firstDate =
      DateTime.now().subtract(const Duration(days: 365 * 10));
  final DateTime lastDate = DateTime.now().add(const Duration(days: 365 * 10));

  String format(DateTime date, String pattern) {
    return DateFormat(pattern).format(date);
  }

  void nextMonth() {
    widget.callback(DateTime(widget.date.year, widget.date.month + 1));
  }

  void previousMonth() {
    widget.callback(DateTime(widget.date.year, widget.date.month - 1));
  }

  void onPressed() async {
    DateTime? selectedTime = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (selectedTime != null) {
      widget.callback(selectedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: previousMonth, icon: const Icon(Icons.arrow_back_ios)),
          TextButton(
            onPressed: onPressed,
            child: Text(
              format(widget.date, 'MMMM yyyy'),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
              onPressed: nextMonth, icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
