import 'package:calendar/cubits/day_cubit.dart';
import 'package:calendar/screens/home_screen.dart';
import 'package:calendar/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DayCubit>(
          create: (context) => DayCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Calendar Widget',
        theme: CustomTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        home: const HomeScreen(),
      ),
    );
  }
}
