import 'package:flutter/material.dart';

import '../models/day_widget_model.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({super.key, this.child, this.callback});

  final DayWidgetModel? child;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: child?.backgroundColor,
        ),
        child: Text(
          '${child?.day ?? ''}',
          style: TextStyle(
            color: child?.color,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
