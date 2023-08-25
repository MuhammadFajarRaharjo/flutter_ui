import 'dart:async';

import 'package:expanse/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  final DateTime targetTime;

  const Countdown({super.key, required this.targetTime});

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late Timer _timer;
  Duration _timeRemaining = const Duration();

  @override
  void initState() {
    super.initState();

    // Menghitung waktu yang tersisa dan memperbarui setiap detik
    _timeRemaining = widget.targetTime.difference(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeRemaining = widget.targetTime.difference(DateTime.now());
      });

      // Berhenti hitungan saat waktu mencapai 0
      if (_timeRemaining.inSeconds <= 0) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _timeRemaining.inMinutes.remainder(60);
    int seconds = _timeRemaining.inSeconds.remainder(60);

    return Text(
      '${formatNumber(minutes)}:${formatNumber(seconds)}',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: kPrimaryColor,
          ),
    );
  }
}
