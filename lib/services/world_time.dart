import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  late String location ;
  late String time ;
  late String flag ;
  late String url ;
  late bool isDaytime ;

WorldTime({required this.location , required this.flag , required this.url}) ;
  Future<void>  getTime() async {
    try {
      final String apiEndpoint = 'http://worldtimeapi.org/api/timezone/$url';
      final Uri url1 = Uri.parse(apiEndpoint);

      Response response = await get(url1);
      Map data = jsonDecode(response.body);
      //print(data);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(dateTime);

      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime=now.hour >6 && now.hour < 20 ? true : false ;
      time = DateFormat.jm().format(now);

      // get prop from data
    }
    catch (e) {
print('caught erreur : $e');
time = 'could not get time data' ;
    }
  }
}
