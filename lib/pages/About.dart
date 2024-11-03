import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  //kvitvladyslav0@gmail.com

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Про програму',
          style: TextStyle(
            fontFamily: 'Tw Cen',
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Про додаток',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tw Cen',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Цей додаток створено як допомiжний до гри RC2025. Тут наразi можна розрахувати вартiсть покупки та продажу магiї за офіціними формулами, а також розрахувати суму податку, крiм того можна переглядати календар гри. Також можна розрахувати мiсяць рiк за заданим рiвнем i навпаки, i нарешті, можна розрахувати вартостi покупки та продажу ядiв',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Tw Cen',
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Команда розробників',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tw Cen',
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Контакт: kvitvladyslav0@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontFamily: 'Tw Cen',
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Версія додатку',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tw Cen',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '1.0.0',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Tw Cen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
