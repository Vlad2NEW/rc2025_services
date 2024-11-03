import 'package:flutter/material.dart';
import 'dart:math';

class Poisonsell extends StatefulWidget {
  const Poisonsell({super.key});

  @override
  State<Poisonsell> createState() => _PoisonsellState();
}

class _PoisonsellState extends State<Poisonsell> {
  double level = 1.0;
  double number = 1.0;
  double maxDigit = 1.0;
  String end = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Розрахування вартості продажу яду',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Tw Cen',
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text(
            'Введiть порядковий номер яду( від 1 до 40)',
            style: TextStyle(
              fontFamily: 'Tw Cen',
            ),
          ),
          TextField(
            onChanged: (String num) {
              setState(() {
                number = double.tryParse(num) ?? 1.0;
              });
            },
          ),
          const Text(
            'Введiть <рівень> яду (записується в iнвентарi V<рівень>) ',
            style: TextStyle(
              fontFamily: 'Tw Cen',
            ),
          ),
          TextField(
            onChanged: (String lvl) {
              setState(() {
                level = double.tryParse(lvl) ?? 1.0;
              });
            },
          ),
          const Text(
            'Введiть перший розряд числа-нагороди у режимі \'Кампанія\'',
            style: TextStyle(
              fontFamily: 'Tw Cen',
            ),
          ),
          TextField(
            onChanged: (String max) {
              setState(() {
                maxDigit = double.tryParse(max) ?? 1.0;
              });
            },
          ),
          const Text(
            'Введiть закiнчення числа(буквену частину) ',
            style: TextStyle(
              fontFamily: 'Tw Cen',
            ),
          ),
          TextField(
            onChanged: (String fin) {
              setState(() {
                end = fin;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          int increment = 0;
          String sign = '';
          double sell = pow(number, pow(level, 0.5)) * maxDigit;
          while (sell >= 100000) {
            sell /= 1000;
            increment++;
          }
          while (sell < 100) {
            sell *= 1000;
            increment--;
          }

          if (increment > 0) {
            sign = '+$increment';
          } else if (increment == 0) {
            sign = 'без змін';
          } else if (increment < 0) {
            if (end == '') {
              sell /= 1000;
              sign = 'без змін';
            } else {
              sign = '$increment';
            }
          }
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Вартiсть продажу',
                    style: TextStyle(
                      fontFamily: 'Tw Cen',
                    ),
                  ),
                  content: Text(
                    '$sell $end($sign)',
                    style: const TextStyle(
                      fontFamily: 'Tw Cen',
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Закрити',
                        style: TextStyle(
                          fontFamily: 'Tw Cen',
                        ),
                      ),
                    ),
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add_business,
          color: Colors.white,
        ),
      ),
    );
  }
}
