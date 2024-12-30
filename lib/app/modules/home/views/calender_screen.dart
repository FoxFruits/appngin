import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalender Pengingat', style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFFA52A2A),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_selectedDay != null) {
                setState(() {
                  if (_events[_selectedDay!] == null) {
                    _events[_selectedDay!] = ['Pengingat ditambahkan'];
                  } else {
                    _events[_selectedDay!]!.add('Pengingat ditambahkan');
                  }
                });
              }
            },
            child: Text('Tetapkan tanggal pengingat',style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFA52A2A)),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final date = _events.keys.elementAt(index);
                final events = _events[date]!;
                return Card(
                  child: ListTile(
                    title: Text('${date.day}/${date.month}/${date.year}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: events.map((event) => Text(event)).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}