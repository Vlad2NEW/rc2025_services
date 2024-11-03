import 'package:flutter/material.dart';
import 'package:rc2025_services/pages/MainPage.dart';
import 'package:rc2025_services/pages/MagicCost.dart';
import 'package:rc2025_services/pages/MagicSell.dart';
import 'package:rc2025_services/pages/Tax.dart';
import 'package:rc2025_services/pages/GameCalendar.dart';
import 'package:rc2025_services/pages/About.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:audio_service/audio_service.dart';
//import 'package:my_app/AudioPlayerTask.dart';
import 'package:rc2025_services/pages/MonthFromLevel.dart';
import 'package:rc2025_services/pages/LevelFromMonth.dart';
import 'package:rc2025_services/pages/Page_01.dart';
import 'package:rc2025_services/pages/PoisonBuy.dart';
import 'package:rc2025_services/pages/PoisonSell.dart';

void main() {
  // Ініціалізація локальних даних
  initializeDateFormatting('uk', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white10,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/MagicCost': (context) => const MagicCost(),
        '/MagicSell': (context) => const MagicSell(),
        '/Tax': (context) => const Tax(),
        '/GameCalendar': (context) => const GameCalendar(),
        '/About': (context) => const About(),
        '/MonthFromLevel': (context) => const MonthFromLevel(),
        '/LevelFromMonth': (context) => const LevelFromMonth(),
        '/Page_01': (context) => const Page01(),
        '/PoisonBuy': (context) => const Poisonbuy(),
        '/PoisonSell': (context) => const Poisonsell(),
      },
    );
  }
}
