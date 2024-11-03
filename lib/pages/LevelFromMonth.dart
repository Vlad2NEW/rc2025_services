import 'package:flutter/material.dart';

class LevelFromMonth extends StatefulWidget {
  const LevelFromMonth({super.key});

  @override
  State<LevelFromMonth> createState() => _LevelFromMonth();
}

class _LevelFromMonth extends State<LevelFromMonth> {
  late int level;
  late int year;
  late String month = months[0];
  final List<String> months = [
    'Січень',
    'Лютий',
    'Березень',
    'Квітень',
    'Травень',
    'Червень',
    'Липень',
    'Серпень',
    'Вересень',
    'Жовтень',
    'Листопад',
    'Грудень'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text(
          'Розрахування рівня за місяцем та роком',
          style: TextStyle(
            fontFamily: 'Tw Cen',
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text(
            'Введiть рік:',
            style: TextStyle(
              fontFamily: 'Tw Cen',
            ),
          ),
          TextField(
            onChanged: (String inputYear) {
              setState(() {
                year = int.tryParse(inputYear) ?? 1001;
              });
            },
          ),
          const SizedBox(height: 10),
          const Text(
            'Оберіть місяць:',
            style: TextStyle(
              fontFamily: 'Tw Cen',
            ),
          ),
          DropdownButton<String>(
            value: month,
            items: months.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? selectedMonth) {
              setState(() {
                month = selectedMonth!;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          int baseLevel = (year - 2025) * 72;
          int monthIndex = months.indexOf(month) + 1;
          int levelInYear = (monthIndex - 1) * 6;

          level = baseLevel + levelInYear + 1;

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  'Рівнi, що відповідають місяцю та року',
                  style: TextStyle(
                    fontFamily: 'Tw Cen',
                  ),
                ),
                content: Text('Рівнi: $level - ${level + 5}'),
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
            },
          );
        },
        child: const Icon(
          Icons.calculate,
          color: Colors.white,
        ),
      ),
    );
  }
}
