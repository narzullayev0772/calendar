import 'package:calendar/utils/constants.dart';
import 'package:flutter/material.dart';

class WeekWidget extends StatelessWidget {
  const WeekWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 7,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 1.5,
      children: Constants.weekDays.map((week) {
        final isLast = week == Constants.weekDays.last;
        return Center(
          child: Text(
            week,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isLast ? const Color(0xFFFF2C2C) : const Color(0xFF7E818C),
            ),
          ),
        );
      }).toList(),
    );
  }
}
