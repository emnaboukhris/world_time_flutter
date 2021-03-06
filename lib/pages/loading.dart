
import 'package:flutter/material.dart';
import 'package:word_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time ='Loading' ;

  void setupWorldTime() async{
  WorldTime instance = WorldTime(location: 'london', flag: 'germena.png', url:'Europe/Berlin');
await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home',
      arguments: {
    'location': instance.location,
    'flag':instance.flag ,
    'time': instance.time
    ,'isDaytime':instance.isDaytime});


}

  void initState(){
    super.initState() ;
    print('ini');
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue[800],
body:Center(
    child :SpinKitCubeGrid(
      color: Colors.white,
      size: 50.0,
    ),
),
    );
  }
}
