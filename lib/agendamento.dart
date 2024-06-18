import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste/cortes.dart';
import 'package:teste/main.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Data';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return 'Horário';
    return time.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => StevesBarberShopApp()));
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/barber_background.jpg'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange[100],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Qual data e horário você gostaria de agendar?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(Icons.calendar_today),
                    label: Text(_formatDate(selectedDate)),
                    style: ElevatedButton.styleFrom(
                    ),
                    onPressed: () => _selectDate(context),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: Icon(Icons.access_time),
                    label: Text(_formatTime(selectedTime)),
                    style: ElevatedButton.styleFrom(
                    ),
                    onPressed: () => _selectTime(context),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Enviar'),
                    style: ElevatedButton.styleFrom(
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cortes()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
