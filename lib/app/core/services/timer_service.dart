import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerService extends ChangeNotifier {
	late Timer timer;

    static late SharedPreferences prefs;
  	
	double currentduration = 1500; // 25 minutes
  	double selectedTime = 1500; // 25 minutes
    double shortBreak = 300; // 5 minutes
    double longBreak = 1500; // 25 minutes
  	bool timerPlaying = false;
  	int rounds = 0;
  	int goal = 0;
  	String currentState = "FOCUS";

    TimerService() {
        currentduration = prefs.getDouble('selectedTime') ?? 1500;
        selectedTime = prefs.getDouble('selectedTime') ?? 1500;
        shortBreak = prefs.getDouble('shortBreak') ?? 300;
        longBreak = prefs.getDouble('longBreak') ?? 1500;
    }

    static Future<void> init() async {
        prefs = await SharedPreferences.getInstance();
    }

  	void start() {
		timerPlaying = true;
		timer = Timer.periodic(const Duration(seconds: 1), (timer) {
	  		if (currentduration == 0) {
				handleNextRound();
	  		} else {
				currentduration--;
				notifyListeners();
	  		}
		});
  	}

  	void pause() {
		timer.cancel();
		timerPlaying = false;
		notifyListeners();
  	}

  	void reset() {
		timer.cancel();
		currentState = "FOCUS";
		currentduration = selectedTime = 1500;
		rounds = goal = 0;
		timerPlaying = false;
		notifyListeners();
  	}

  	void selectTime(double seconds) {
        prefs.setDouble('selectedTime', seconds);
		selectedTime = seconds;
		currentduration = seconds;
		notifyListeners();
  	}

    void selectShortBreak(double seconds) {
        prefs.setDouble('shortBreak', seconds);
        shortBreak = seconds;
        notifyListeners();
    }

    void selectLongBreak(double seconds) {
        prefs.setDouble('longBreak', seconds);
        longBreak = seconds;
        notifyListeners();
    }

  	void handleNextRound() {
		if (currentState == "FOCUS" && rounds != 3) {
	  		currentState = "BREAK";
	  		currentduration = shortBreak; // 5 minutes
	  		selectedTime = shortBreak; // 5 minutes
	  		rounds++;
	  		goal++;
		} else if (currentState == "BREAK") {
	  		currentState = "FOCUS";
	  		currentduration = 1500; // 25 minutes
	  		selectedTime = 1500; // 25 minutes
		} else if (currentState == "FOCUS" && rounds == 3) {
	  		currentState = "LONG BREAK";
	  		currentduration = longBreak; // 25 minutes
	  		selectedTime = longBreak; // 25 minutes
	  		rounds++;
	  		goal++;
		} else if (currentState == "LONG BREAK") {
	  		currentState = "FOCUS";
	  		currentduration = 1500; // 25 minutes
	  		selectedTime = 1500; // 25 minutes
	  		rounds = 0;
		}

		notifyListeners();
  }
}
