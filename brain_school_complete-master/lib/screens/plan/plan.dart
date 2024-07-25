import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PlanPage extends StatefulWidget {
  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  TextEditingController _planController = TextEditingController();
  Map<DateTime, List<dynamic>> _events = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planlarım'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (day) {
              return _events[day] ?? [];
            },
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _planController,
              decoration: InputDecoration(
                hintText: 'Planınızı buraya yazın',
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _events[_selectedDay] ??= [];
                  _events[_selectedDay]!.add(_planController.text);
                  _planController.clear();
                });
              },
              child: Text('Plan Ekle'),
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: _events[_selectedDay]?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_events[_selectedDay]![index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _events[_selectedDay]!.removeAt(index);
                      });
                    },
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
