import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/services/timer_service.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatelessWidget {
    const TimerCard({super.key});

    @override
    Widget build(BuildContext context) {
        final provider = Provider.of<TimerService>(context);
        
        return Column(
            children: [
                                
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 3.2,
                            height: 170,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadiusDirectional.circular(15),
                            ),
                            child: Center(
                                child: Text(
                                    (provider.currentduration ~/ 60).toString(),
                                    style: TextStyle(
                                        color: renderColor(provider.currentState),
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold
                                    ),
                                ),
                            ),
                        ),
                        
                        const SizedBox(width: 15),

                        const Text(':', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),

                        const SizedBox(width: 15),
                        
                        Container(
                            width: MediaQuery.of(context).size.width / 3.2,
                            height: 170,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadiusDirectional.circular(15)
                            ),
                            
                            child: Center(
                                child: Text(
                                    (provider.currentduration % 60) == 0 ? "${(provider.currentduration % 60).round()}0" : (provider.currentduration % 60).round().toString(),
                                    style: TextStyle(
                                        color: renderColor(provider.currentState),
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold
                                    ),
                                ),
                            ),
                        ),
                    ],
                )
            ],
        );
    }
}

Color renderColor(String currentState) {
    if (currentState == "FOCUS") {
        return Colors.black;
    } else {
        return Colors.green;
    }
}
