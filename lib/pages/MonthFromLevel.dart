import 'package:flutter/material.dart';

class MonthFromLevel extends StatefulWidget {
  const MonthFromLevel({super.key});

  @override
  State<MonthFromLevel> createState() => _MonthFromLevel();
}

class _MonthFromLevel extends State<MonthFromLevel> {
  late int level;
  late int year;
  late String month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Розрахування місяця\nза заданим рівнем',
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
            'Введiть рівень досвіду (ліворуч зверху)',
            style: TextStyle(
              fontFamily: 'Tw Cen',
            ),
          ),
          TextField(
            onChanged: (String lvl) {
              setState(() {
                level = int.tryParse(lvl) ?? 1;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          if ((level % 72) == 0) {
            year = (level ~/ 72) + 2024;
            month = 'Грудень';
          } else {
            year = (level ~/ 72) + 2025;
          }

          int levelInYear = level % 72;
          int monthIndex = (levelInYear ~/ 6) + 1;

          if (levelInYear % 6 == 0) {
            monthIndex--;
          }

          switch (monthIndex) {
            case 1:
              month = 'Січень';
              break;
            case 2:
              month = 'Лютий';
              break;
            case 3:
              month = 'Березень';
              break;
            case 4:
              month = 'Квітень';
              break;
            case 5:
              month = 'Травень';
              break;
            case 6:
              month = 'Червень';
              break;
            case 7:
              month = 'Липень';
              break;
            case 8:
              month = 'Серпень';
              break;
            case 9:
              month = 'Вересень';
              break;
            case 10:
              month = 'Жовтень';
              break;
            case 11:
              month = 'Листопад';
              break;
            case 12:
              month = 'Грудень';
              break;
          }

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  'Місяць, що відповідає рівню',
                  style: TextStyle(
                    fontFamily: 'Tw Cen',
                  ),
                ),
                content: Text('$month $year'),
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
