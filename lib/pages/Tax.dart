import 'package:flutter/material.dart';

class Tax extends StatefulWidget {
  const Tax({super.key});

  @override
  State<Tax> createState() => _TaxState();
}

class _TaxState extends State<Tax> {
  double balance = 0.0;
  final percent = 15.0;
  late String end = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Розрахування суми податку у грі RC 2025',
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
            'Введiть свій баланс на 01.<поточний_місяць>.<поточний_рік>',
            style: TextStyle(
              fontFamily: 'Tw Cen',
            ),
          ),
          TextField(
            onChanged: (String bal) {
              setState(() {
                balance = double.tryParse(bal) ?? 0.0;
              });
              const TextStyle(
                fontFamily: 'Tw Cen',
              );
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
              const TextStyle(
                fontFamily: 'Tw Cen',
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          double tax = balance * percent / 100;
          String sign = '';
          int increment = 0;
          while (tax >= 100000) {
            tax /= 1000;
            increment++;
          }
          while (tax < 100 && end != '') {
            tax *= 1000;
            increment--;
          }

          if (increment > 0) {
            sign = '+$increment';
          } else if (increment == 0) {
            sign = 'без змін';
          } else if (increment < 0) {
            if (end == '') {
              tax /= 1000;
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
                    'Сума податку',
                    style: TextStyle(
                      fontFamily: 'Tw Cen',
                    ),
                  ),
                  content: Text(
                    '$tax $end($sign)',
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
