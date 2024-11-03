import 'package:flutter/material.dart';

class Tax extends StatefulWidget {
  const Tax({super.key});

  @override
  State<Tax> createState() => _TaxState();
}

class _TaxState extends State<Tax> {
  double balance = 0.0;
  final percent = 10.0;
  late String end = 'в';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text(
          'Розрахування суми податку у грі 1001+',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Times_New_Roman',
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text(
            'Введiть свій баланс на 01.<поточний_місяць>.<поточний_рік>',
            style: TextStyle(
              fontFamily: 'Times_New_Roman',
            ),
          ),
          TextField(
            onChanged: (String bal) {
              setState(() {
                balance = double.tryParse(bal) ?? 0.0;
              });
              const TextStyle(
                fontFamily: 'Times_New_Roman',
              );
            },
          ),
          const Text(
            'Введiть закiнчення числа(буквену частину) ',
            style: TextStyle(
              fontFamily: 'Times_New_Roman',
            ),
          ),
          TextField(
            onChanged: (String fin) {
              setState(() {
                end = fin;
              });
              const TextStyle(
                fontFamily: 'Times_New_Roman',
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          double tax = balance * percent / 100;
          int increment = 0;
          while (tax >= 100000) {
            tax /= 1000;
            increment++;
          }
          while (tax < 100) {
            tax *= 1000;
            increment--;
          }
          String sign = '';
          if (increment > 0) {
            sign = '+$increment';
          } else if (increment == 0) {
            sign = 'без змін';
          } else if (increment < 0) {
            sign = '$increment';
          }

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Сума податку',
                    style: TextStyle(
                      fontFamily: 'Times_New_Roman',
                    ),
                  ),
                  content: Text(
                    '$tax $end($sign)',
                    style: const TextStyle(
                      fontFamily: 'Times_New_Roman',
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
                          fontFamily: 'Times_New_Roman',
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
