import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/services/timer_service.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatelessWidget {
    const ProgressBar({super.key});

    @override
    Widget build(BuildContext context) {
        final provider = Provider.of<TimerService>(context);

        return Column(
            children: [
                LinearProgressIndicator(
                    minHeight: 10,
                     value: provider.currentduration / provider.selectedTime,
                    backgroundColor: Colors.black,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
                ),
            ],
        );
    }
}