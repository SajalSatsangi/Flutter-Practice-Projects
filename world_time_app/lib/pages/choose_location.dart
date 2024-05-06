import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  String currentTime = '12:34:56';

  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        time: '12:34:56',
        flag: 'uk.png',
        isDaytime: false),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        time: '12:34:56',
        flag: 'greece.png',
        isDaytime: false),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        time: '12:34:56',
        flag: 'egypt.png',
        isDaytime: false),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        time: '12:34:56',
        flag: 'kenya.png',
        isDaytime: false),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        time: '12:34:56',
        flag: 'usa.png',
        isDaytime: false),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        time: '12:34:56',
        flag: 'usa.png',
        isDaytime: false),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        time: '12:34:56',
        flag: 'south_korea.png',
        isDaytime: false),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        time: '12:34:56',
        flag: 'indonesia.png',
        isDaytime: false),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to homeScreen
    Navigator.pop(context, {
      '/location': instance.location,
      '/flag': instance.flag,
      '/time': instance.time,
      '/isDayTime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Choose a location',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
