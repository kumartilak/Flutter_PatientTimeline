import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Activity Details Page"),
        ),
        body: Column(
          children: <Widget>[
            Image.network(
                'https://images.indianexpress.com/2020/04/doctor-12-1.jpg'),
            SizedBox(height: 16),
            Text(
              'Attended by: Doctor X',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('01 Dec 2020 11:00 AM'),
            SizedBox(height: 16),
            Text(
                'Observation Details: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
          ],
        ));
  }
}
