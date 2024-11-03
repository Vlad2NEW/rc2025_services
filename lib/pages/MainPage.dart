import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Сервіси гри RC 2025',
          style: TextStyle(
            fontFamily: 'Tw Cen',
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/MonthFromLevel');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250.0, 50.0), // Ваші розміри
                backgroundColor: Colors.brown,
              ),
              child: const Text(
                'Розрахування місяця за заданим рівнем',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tw Cen',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/LevelFromMonth');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250.0, 50.0), // Ваші розміри
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Розрахування рівня за заданим місяцем',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tw Cen',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/MagicCost');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250.0, 50.0), // Ваші розміри
                backgroundColor: Colors.redAccent,
              ),
              child: const Text(
                'Розрахування вартості покупки магії у грі RC 2025',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tw Cen',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0), // Відступ між кнопками
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/MagicSell');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250.0, 50.0), // Ваші розміри
                backgroundColor: Colors.greenAccent,
              ),
              child: const Text(
                'Розрахування вартості продажу магії у грі RC 2025',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tw Cen',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0), // Відступ між кнопками
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Tax');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250.0, 50.0),
                backgroundColor: Colors.orange, // Ваші розміри
              ),
              child: const Text(
                'Розрахування суми податку у грі RC 2025',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tw Cen',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Page_01');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100.0, 30.0),
                backgroundColor: Colors.white60, // Ваші розміри
              ),
              child: const Text(
                '>>',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tw Cen',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
