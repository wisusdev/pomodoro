import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/services/timer_service.dart';
import 'package:pomodoro/app/widgets/timer_card.dart';
import 'package:provider/provider.dart';

class TimerOptions extends StatelessWidget {
    
    final List<String> selectableTimes = [
        "300", // 5 minutes
        "600", // 10 minutes
        "900", // 15 minutes
        "1200", // 20 minutes
        "1500", // 25 minutes
        "1800", // 30 minutes
        "2100", // 35 minutes
        "2400", // 40 minutes
        "2700", // 45 minutes
        "3000", // 50 minutes
        "3300", // 55 minutes
        "3600", // 60 minutes
    ];

    TimerOptions({super.key});

    @override
    Widget build(BuildContext context) {
        final provider = Provider.of<TimerService>(context);
        
        return SingleChildScrollView(
            controller: ScrollController(initialScrollOffset: 155),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: selectableTimes.map((time) {
                    return InkWell(
                        onTap: () => provider.selectTime(double.parse(time)),
                        child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: 70,
                            height: 50,
                            decoration: int.parse(time) == provider.selectedTime ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)) : BoxDecoration(border: Border.all(width: 3, color: Colors.white30), borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text((int.parse(time) ~/ 60).toString(),
                                    style: int.parse(time) == provider.selectedTime ? TextStyle(fontSize: 20, color: renderColor(provider.currentState)) : const TextStyle(fontSize: 20,color: Colors.white,)
                                ),
                            ),
                        ),
                    );
                }).toList(),
            ),
        );
    }
}
