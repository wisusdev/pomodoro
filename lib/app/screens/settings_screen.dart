import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/services/timer_service.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
    const SettingsScreen({super.key});

    static const List<String> selectableTimes = [
        "900", // 15 minutes
        "1200", // 20 minutes
        "1500", // 25 minutes
        "1800", // 30 minutes
        "2700", // 45 minutes
        "3000", // 50 minutes
        "3600", // 60 minutes
        "5400", // 90 minutes
    ];

    static const List<String> selectableShortBreaks = [
        "300", // 5 minutes
        "600", // 10 minutes
    ];

    static const List<String> selectableLongBreaks = [
        "900", // 15 minutes
        "1200", // 20 minutes
        "1800", // 30 minutes
    ];

    @override
    Widget build(BuildContext context) {
        final provider = Provider.of<TimerService>(context);
        
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                elevation: 10,
                backgroundColor: Colors.black,
                iconTheme: const IconThemeData(color: Colors.white, size: 40),
                title: const Text('SETTINGS-*#!', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.yellow)),
                
            ),
            body: SingleChildScrollView(
                child: Container(
                    alignment: Alignment.center,
                    child: Column(
                        children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    children: [
                                        // Duration
                                        ListTile(
                                            title: const Text('Duration', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                                            subtitle: const Text('25 minutes default', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white)),
                                            trailing: PopupMenuButton<String>(
                                                child: Container(
                                                    padding: const EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    child: Text('${provider.selectedTime ~/ 60} min', style: const TextStyle(fontSize: 16, color: Colors.black)),
                                                ),
                                                onSelected: (String value) {
                                                    provider.selectTime(double.parse(value));
                                                },
                                                itemBuilder: (BuildContext context) {
                                                    return selectableTimes.map((String time) {
                                                        return PopupMenuItem<String>(
                                                            value: time,
                                                            child: Text('${int.parse(time) ~/ 60} min', style: const TextStyle(fontSize: 18, color: Colors.black)),
                                                        );
                                                    }).toList();
                                                },
                                            ),
                                        ),
                                
                                        const Divider(color: Colors.grey),
                                
                                        // Short Break
                                        ListTile(
                                            title: const Text('Short Break', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                                            subtitle: const Text('5 minutes default', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white)),
                                            trailing: PopupMenuButton<String>(
                                                child: Container(
                                                    padding: const EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    child: Text('${provider.shortBreak ~/ 60} min', style: const TextStyle(fontSize: 16, color: Colors.black)),
                                                ),
                                                onSelected: (String value) {
                                                    provider.selectShortBreak(double.parse(value));
                                                },
                                                itemBuilder: (BuildContext context) {
                                                    return selectableShortBreaks.map((String time) {
                                                        return PopupMenuItem<String>(
                                                            value: time,
                                                            child: Text('${int.parse(time) ~/ 60} min', style: const TextStyle(fontSize: 18, color: Colors.black)),
                                                        );
                                                    }).toList();
                                                },
                                            ),
                                        ),

                                        const Divider(color: Colors.grey),
                                
                                        // Long Break
                                        ListTile(
                                            title: const Text('Long Break', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                                            subtitle: const Text('15 minutes default', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white)),
                                            trailing: PopupMenuButton<String>(
                                                child: Container(
                                                    padding: const EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    child: Text('${provider.longBreak ~/ 60} min', style: const TextStyle(fontSize: 16, color: Colors.black)),
                                                ),
                                                onSelected: (String value) {
                                                     provider.selectLongBreak(double.parse(value));
                                                },
                                                itemBuilder: (BuildContext context) {
                                                    return selectableLongBreaks.map((String time) {
                                                        return PopupMenuItem<String>(
                                                            value: time,
                                                            child: Text('${int.parse(time) ~/ 60} min', style: const TextStyle(fontSize: 18, color: Colors.black)),
                                                        );
                                                    }).toList();
                                                },
                                            ),
                                        ),

                                        const Divider(color: Colors.grey),

                                        // Start Break automatically
                                        ListTile(
                                            title: const Text('Start Break Automatically', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                                            trailing: Switch(
                                                value: false,
                                                onChanged: (bool value) {
                                                    print('Start Break Automatically: $value');
                                                },
                                            ),
                                        ),

                                        const Divider(color: Colors.grey),

                                        // Start flow automatically
                                        ListTile(
                                            title: const Text('Start Flow Automatically', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                                            trailing: Switch(
                                                value: false,
                                                onChanged: (bool value) {
                                                    print('Start Flow Automatically: $value');
                                                },
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}