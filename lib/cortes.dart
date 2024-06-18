import 'package:flutter/material.dart';
import 'package:teste/agendamento.dart';
import 'package:teste/concluido.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cortes(),
    );
  }
}

class Cortes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppointmentScreen()));},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Qual atendimento você gostaria de realizar?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircularButton(
                  context,
                  'assets/beard.png',
                  'Barba',
                ),
                _buildCircularButton(
                  context,
                  'assets/haircut.png',
                  'Corte de cabelo',
                ),
                _buildCircularButton(
                  context,
                  'assets/hair_and_beard.png',
                  'Cabelo e barba',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceOption extends StatelessWidget {
  final String imagePath;
  final String label;

  ServiceOption({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

Widget _buildCircularButton(BuildContext context, String imagePath, String label) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessScreen()));}
          },
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
