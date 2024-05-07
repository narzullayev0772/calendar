import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/day_response_model.dart';
import '../models/day_widget_model.dart';
import '../models/enum_response_model.dart';
import '../services/api_service.dart';

abstract class DayState {}

class DayInitial extends DayState {}

class DayLoading extends DayState {}

class DayLoaded extends DayState {
  final List<DayWidgetModel> selectedDays;

  DayLoaded({this.selectedDays = const []});
}

class DayError extends DayState {
  final String message;

  DayError({required this.message});
}

class DayCubit extends Cubit<DayState> {
  DayCubit() : super(DayInitial());

  Future<void> getDays() async {
    try {
      emit(DayLoading());
      EnumResponse enums = await ApiService().getEnums();
      DayResponse days = await ApiService().getDays();
      List<DayWidgetModel> selectedDays =
          generateDays(enums: enums.enums, days: days.days);
      emit(DayLoaded(selectedDays: selectedDays));
    } catch (e) {
      emit(DayError(message: e.toString()));
    }
  }

  static List<DayWidgetModel> generateDays(
      {required List<EnumModel> enums, required List<Day> days}) {
    final List<DayWidgetModel> selectedDays = [];
    for (final day in days) {
      EnumModel enumModel =
          enums.firstWhere((element) => element.type == day.type);
      // set text color based on background color
      Color textColor = enumModel.colorValue.computeLuminance() > 0.7
          ? Colors.black
          : Colors.white;
      selectedDays.add(DayWidgetModel(
        color: textColor,
        backgroundColor: enumModel.colorValue,
        day: day.day,
        type: day.type,
      ));
    }
    return selectedDays;
  }
}
