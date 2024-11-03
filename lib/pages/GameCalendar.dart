import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameCalendar extends StatefulWidget {
  const GameCalendar({super.key});

  @override
  _GameCalendarState createState() => _GameCalendarState();
}

class _GameCalendarState extends State<GameCalendar> {
  int currentYear = 2025;
  int currentMonth = 1;
  DateTime selectedDate = DateTime(2025, 1, 1);
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime(2025, 1, 1);
  List<DateTime> holidays = [];

  final List<String> animals = [
    'Пацюка',
    'Бика',
    'Тигра',
    'Кролика',
    'Дракона',
    'Змії',
    'Коня',
    'Кози',
    'Мавпи',
    'Півня',
    'Собаки',
    'Свинi'
  ];

  final List<String> elements = [
    'Дерев\'яного(ої)',
    'Вогняного(ої)',
    'Земляного(ої)',
    'Металевого(ої)',
    'Водяного(ої)'
  ];

  @override
  void initState() {
    super.initState();
    _loadLastViewedMonthYear();
  }

  void _updateCalendar() {
    setState(() {
      _focusedDay = DateTime(currentYear, currentMonth, 1);
      selectedDate = _focusedDay;
    });
  }

  Future<void> _loadLastViewedMonthYear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final year = prefs.getInt('lastYear') ?? 2025;
      final month = prefs.getInt('lastMonth') ?? 1;
      print('Loaded: Year: $year, Month: $month'); // Debugging
      setState(() {
        currentYear = year;
        currentMonth = month;
        _focusedDay = DateTime(currentYear, currentMonth, 1);
        selectedDate = _focusedDay;
        _updateHolidays();
      });
    } catch (e) {
      print('Error loading preferences: $e');
    }
  }

  Future<void> _saveLastViewedMonthYear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      print('Saving: Year: $currentYear, Month: $currentMonth'); // Debugging
      await prefs.setInt('lastYear', currentYear);
      await prefs.setInt('lastMonth', currentMonth);
    } catch (e) {
      print('Error saving preferences: $e');
    }
  }

  String getChineseYear(int year) {
    final int animalIndex = (year - 4) % 12;
    final int elementIndex = ((year - 4) % 10) ~/ 2;
    return '${elements[elementIndex]} ${animals[animalIndex]}';
  }

  void _updateHolidays() {
    setState(() {
      holidays = [
        DateTime(currentYear, 1, 1),
        DateTime(currentYear, 2, 25),
        DateTime(currentYear, 5, 1),
        DateTime(currentYear, 5, 8),
        DateTime(currentYear, 6, 28),
        DateTime(currentYear, 7, 15),
        DateTime(currentYear, 8, 24),
        DateTime(currentYear, 10, 1),
        DateTime(currentYear, 12, 25),
      ];
    });
  }

  bool isHoliday(DateTime day) {
    return holidays.any((holiday) => isSameDay(holiday, day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Календар до гри',
            style: TextStyle(fontFamily: 'Tw Cen')),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Рік',
                        hintText: 'Введіть рік',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          final year = int.tryParse(value);
                          if (year != null) {
                            setState(() {
                              currentYear = year;
                              _updateHolidays();
                              _updateCalendar();
                              _saveLastViewedMonthYear(); // Ensure saving when year changes
                            });
                          }
                        }
                      },
                      style: const TextStyle(fontFamily: 'Tw Cen'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: DropdownButton<int>(
                      value: currentMonth,
                      items: List.generate(12, (index) {
                        return DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text(
                            [
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
                            ][index],
                            style: const TextStyle(fontFamily: 'Tw Cen'),
                          ),
                        );
                      }),
                      onChanged: (newValue) {
                        if (newValue != null) {
                          setState(() {
                            currentMonth = newValue;
                            _updateCalendar();
                            _saveLastViewedMonthYear(); // Ensure saving when month changes
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '$currentYear - Рiк ${getChineseYear(currentYear)}',
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Tw Cen',
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              TableCalendar(
                firstDay: DateTime(-20000, 1, 1),
                lastDay: DateTime(20000, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                  todayDecoration: BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Tw Cen',
                    fontSize: 16,
                  ),
                  holidayTextStyle: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Tw Cen',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                locale: 'uk',
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Tw Cen',
                  ),
                  leftChevronIcon:
                      Icon(Icons.chevron_left, color: Colors.black),
                  rightChevronIcon:
                      Icon(Icons.chevron_right, color: Colors.black),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Tw Cen',
                    fontSize: 13,
                  ),
                  weekendStyle: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Tw Cen',
                    fontSize: 13,
                  ),
                ),
                weekNumbersVisible: true,
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, date, focusedDay) {
                    bool isHolidayDay = isHoliday(date);
                    bool isSaturday = date.weekday == DateTime.saturday;
                    bool isSunday = date.weekday == DateTime.sunday;
                    return Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          color: isHolidayDay
                              ? Colors.red
                              : (isSaturday
                                  ? Colors.grey
                                  : (isSunday ? Colors.red : Colors.black)),
                          fontFamily: 'Tw Cen',
                          fontSize: 25,
                        ),
                      ),
                    );
                  },
                  weekNumberBuilder: (context, weekNumber) {
                    return Center(
                      child: Text(
                        '$weekNumber',
                        style: const TextStyle(
                          color: Colors.green,
                          fontFamily: 'Tw Cen',
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                  todayBuilder: (context, date, focusedDay) {
                    bool isHolidayDay = isHoliday(date);
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: isHolidayDay ? Colors.redAccent : Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${date.day}',
                          style: TextStyle(
                            color: isHolidayDay
                                ? Colors.white70
                                : Colors.cyanAccent,
                            fontFamily: 'Tw Cen',
                            fontSize: 25,
                          ),
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, date, focusedDay) {
                    bool isHolidayDay = isHoliday(date);
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: isHolidayDay ? Colors.orange : Colors.brown,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${date.day}',
                          style: TextStyle(
                            color:
                                isHolidayDay ? Colors.white : Colors.cyanAccent,
                            fontFamily: 'Tw Cen',
                            fontSize: 25,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selectedDate = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDate, day);
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                    currentYear = focusedDay.year;
                    currentMonth = focusedDay.month;
                    _saveLastViewedMonthYear(); // Ensure saving when page changes
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
