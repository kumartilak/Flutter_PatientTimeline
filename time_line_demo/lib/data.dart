import 'package:flutter/material.dart';

class Event {
  final String name;
  final String time;
  final String content;
  final String urlToImage;
  final Color iconBackground;
  final Icon icon;
  const Event(
      {this.name,
      this.time,
      this.content,
      this.urlToImage,
      this.icon,
      this.iconBackground});
}

const List<Event> events = [
  Event(
      name: "Admitted",
      time: "01 Dec 2020 10:55 AM",
      content: "Acute Pain",
      urlToImage: "https://mumbaimirror.indiatimes.com/photo/75396843.cms",
      icon: Icon(Icons.add, color: Colors.white),
      iconBackground: Colors.green),
  Event(
      name: "Attended by: Doctor X",
      time: "01 Dec 2020 11:00 AM",
      content: "",
      urlToImage: "https://images.indianexpress.com/2020/04/doctor-12-1.jpg",
      icon: Icon(Icons.person, color: Colors.white),
      iconBackground: Colors.cyan),
  Event(
      name: "COVID Test done",
      time: "01 Dec 2020 11:00 AM",
      content: "",
      urlToImage:
          "https://www.gannett-cdn.com/-mm-/9e1f6e2ee20f44aa1f3be4f71e9f3e52b6ae2c7e/c=0-110-2121-1303/local/-/media/2020/04/06/USATODAY/usatsports/gettyimages-1205778418.jpg",
      icon: Icon(Icons.check, color: Colors.white),
      iconBackground: Colors.deepOrange),
];
