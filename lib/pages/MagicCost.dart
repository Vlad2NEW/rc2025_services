import 'dart:math';

import 'package:flutter/material.dart';

class MagicCost extends StatefulWidget {
  const MagicCost({super.key});

  @override
  State<MagicCost> createState() => _MagicCostState();
}

class _MagicCostState extends State<MagicCost> {
  late double level = 1.0;
  late String end = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Розрахування вартості покупки магії',
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
            'Введiть рівень досвіду(лiворуч зверху) ',
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
        backgroundColor: Colors.redAccent,
        onPressed: () {
          int increment = 0;
          String sign = '';
          double cost = level * pow(2, 0.001 * level);
          while (cost >= 100000) {
            cost /= 1000;
            increment++;
          }
          while (cost < 100) {
            cost *= 1000;
            increment--;
          }
          if (increment > 0) {
            sign = '+$increment';
          } else if (increment == 0) {
            sign = 'без змін';
          } else if (increment < 0 && sign == '') {
            cost /= 1000.0;
            sign = 'без змін';
          }

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Вартiсть покупки',
                    style: TextStyle(
                      fontFamily: 'Tw Cen',
                    ),
                  ),
                  content: Text('$cost $end($sign)'),
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
