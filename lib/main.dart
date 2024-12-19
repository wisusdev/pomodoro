import 'package:flutter/material.dart';
import 'package:pomodoro/app/screens/home_screen.dart';
import 'package:pomodoro/app/core/services/timer_service.dart';
import 'package:pomodoro/app/screens/settings_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider<TimerService>(
        create: (_) => TimerService(),
        child: const MyApp(),
    )
);

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,

            home: const HomeScreen(),
            
            routes: {
                '/home': (context) => const HomeScreen(),
                '/settings': (context) => const SettingsScreen(),
            },
        );
    }
}
