import 'package:calendar/cubits/day_cubit.dart';
import 'package:calendar/utils/generator.dart';
import 'package:calendar/widgets/date_button.dart';
import 'package:calendar/widgets/grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widgets/week_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    context.read<DayCubit>().getDays();
  }

  String format(DateTime date, String pattern) {
    return DateFormat(pattern).format(date);
  }

  void setDate(DateTime selectedTime) {
    setState(() {
      date = selectedTime;
    });
    // Fetch data from API
    /// TODO: Add API call here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 16,
            children: [
              DateButton(callback: setDate),
              const Divider(),
              const WeekWidget(),
              BlocBuilder<DayCubit, DayState>(
                builder: (context, state) {
                  if (state is DayLoaded) {
                    return CustomGridView(
                      children:
                          Generator.getDayWidgets(date: date, state: state),
                    );
                  } else if (state is DayError) {
                    return Text(state.message);
                  } else {
                    return Stack(
                      children: [
                        Opacity(
                          opacity: 0.3,
                          child: CustomGridView(
                            children: Generator.getDayWidgets(date: date),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: MediaQuery.of(context).size.width / 2 - 12,
                          child: const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator()),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
