import 'package:http/http.dart'; // Import with alias
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //loaction name for the UI
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDaytime; //true or false if daytime or not

  WorldTime(
      {required this.location,
      required this.flag,
      required this.time,
      required this.url,
      required this.isDaytime});

  Future<void> getTime() async {
    try {
      final fullurl =
          Uri.parse('https://www.worldtimeapi.org/api/timezone/$url');
      Response response = await get(fullurl);

      // Correctly decode the response body (assuming it's JSON)
      final data = jsonDecode(response.body);

      // print(data); // Print the decoded data (Map or List)

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error $e');
      time = 'could not get time data';
    }
  }
}
