import 'package:flutter/material.dart';

class Page01 extends StatefulWidget {
  const Page01({super.key});

  @override
  State<Page01> createState() => _Page01State();
}

class _Page01State extends State<Page01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: const Text(
            'Сторiнка 1',
            style: TextStyle(
              fontFamily: 'Times_New_Roman',
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, '/MainPage');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white60, // Ваші розміри
                ),
                child: const Text(
                  '<<',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Times_New_Roman',
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Відступ між кнопками
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/PoisonBuy');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent, // Ваші розміри
                ),
                child: const Text(
                  'Розрахування вартостi покупки яду(в розробцi)',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Times_New_Roman',
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Відступ між кнопками
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/PoisonSell');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent, // Ваші розміри
                ),
                child: const Text(
                  'Розрахування вартостi продажу яду(в розробцi)',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Times_New_Roman',
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GameCalendar');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, // Ваші розміри
                ),
                child: const Text(
                  'Календар до гри',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Times_New_Roman',
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Відступ між кнопками
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/About');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellowAccent, // Ваші розміри
                ),
                child: const Text(
                  'Про програму',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Times_New_Roman',
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
