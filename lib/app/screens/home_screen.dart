import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/services/timer_service.dart';
import 'package:pomodoro/app/widgets/progress.dart';
import 'package:pomodoro/app/widgets/progress_bar.dart';
import 'package:pomodoro/app/widgets/time_controller.dart';
import 'package:pomodoro/app/widgets/timer_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});
    
    Color renderColor(String currentState) {
        if (currentState == "FOCUS") {
            return Colors.black;
        } else {
            return Colors.green;
        }
    }

    @override
    Widget build(BuildContext context) {
        final provider = Provider.of<TimerService>(context);
        
        return Scaffold(
            backgroundColor: renderColor(provider.currentState),
            
            appBar: AppBar(
                elevation: 10,
                backgroundColor: renderColor(provider.currentState),
                
                title: const Text('POMOTIMER-*#!', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.yellow)),
                
                actions: [
                    IconButton(
                        icon: const Icon(Icons.refresh),
                        iconSize: 40,
                        color: Colors.white,
                        onPressed: () => Provider.of<TimerService>(context, listen: false).reset(),
                    ),
                    IconButton(
                        icon: const Icon(Icons.settings),
                        iconSize: 40,
                        color: Colors.white,
                        onPressed: () => Navigator.pushNamed(context, '/settings'),
                    ),
                ],
            ),
            
            body: SingleChildScrollView(
                child: Container(
                    alignment: Alignment.center,
                    child: const Column(
                        children: [
                            SizedBox(height: 40),
                            
                            TimerCard(),
                                                        
                            SizedBox(height: 50),

                            ProgressBar(),

                            SizedBox(height: 50),

                            
                            TimeController(),
                            
                            SizedBox(height: 70),

                            Progress()
                        ],
                    ),
                ),
            ),
        );
    }
}
