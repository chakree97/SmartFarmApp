import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smartfarm/model/monitor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final Stream<Monitor> randomMonitor = Stream.periodic(Duration(seconds: 1),(count){
      double temperature = Random().nextDouble() * 35 + 10;
      double humidity = Random().nextDouble() * 60 + 10;
      double pH = Random().nextDouble() * 7 + 1;
      double soilEC = Random().nextDouble() * 1.3 + 0.5;
      return Monitor(temperature: temperature, humidity: humidity, pH: pH < 6.2 ? 6.2 : pH, soilEC: soilEC);
    });
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          'Smart Farm',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: width,
              height: height*0.4,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(width*0.75),
                  bottomRight: Radius.circular(width*0.5)
                )
              ),
            ),
          ),
          Positioned(
            left: width*0.1,
            top: height*0.05,
            child: const Text(
              'Welcome to',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: width*0.1,
            top: height*0.09,
            child: const Text(
              'Farm Naikree',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: width*0.1,
            top: height*0.18,
            child: StreamBuilder(
              stream: randomMonitor, builder: (context,snapshot){
                if(snapshot.hasData){
                  return Container(
                    width: width,
                    height: height*0.25,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: width*0.05),
                          width: width*0.35,
                          height: height*0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Temperature',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                              Image.asset('assets/temp.png',width: 60,height: 60,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.temperature.toStringAsFixed(2),style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontFamily: 'Poppins'
                                  ),),
                                  const Text('°C',style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontFamily: 'Poppins'
                                  ),)
                                ],
                              )
                            ],
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(right: width*0.05),
                          width: width*0.35,
                          height: height*0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Humidity',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                              Image.asset('assets/drop.png',width: 60,height: 60,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.humidity.toStringAsFixed(2),style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontFamily: 'Poppins'
                                  ),),
                                  const Text('%',style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontFamily: 'Poppins'
                                  ),)
                                ],
                              )
                            ],
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(right: width*0.05),
                          width: width*0.35,
                          height: height*0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('pH',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                              Image.asset('assets/ph.png',width: 60,height: 60,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.pH.toStringAsFixed(2),style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontFamily: 'Poppins'
                                  ),),
                                  const Text('pH',style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontFamily: 'Poppins'
                                  ),)
                                ],
                              )
                            ],
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(right: width*0.05),
                          width: width*0.35,
                          height: height*0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Soil EC',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                              Image.asset('assets/soil-ec.png',width: 60,height: 60,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.soilEC.toStringAsFixed(2),style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontFamily: 'Poppins'
                                  ),),
                                  const Text('mS/m',style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontFamily: 'Poppins'
                                  ),)
                                ],
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  );
                }
                else if(snapshot.hasError){
                  return CircularProgressIndicator();
                }
                else{
                  return CircularProgressIndicator();
                }
              }
            )
          ),
          Positioned(
            left: width*0.05,
            top: height * 0.5,
            child: Container(
              width: width - width*0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white
              ),
              child: const Column(
                children: [
                  Switch(
                    title: 'Switch 1',
                    initialValue: false,
                  ),
                  Switch(
                    title: 'Switch 2',
                    initialValue: false,
                  ),
                  Switch(
                    title: 'Switch 3',
                    initialValue: false,
                  ),
                  Switch(
                    title: 'Switch 4',
                    initialValue: false,
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }
}

class Switch extends StatefulWidget {
  final String title;
  final bool initialValue;
  const Switch({
    super.key,
    required this.title,
    required this.initialValue
  });

  @override
  State<Switch> createState() => _SwitchState();
}

class _SwitchState extends State<Switch> {
  bool _light = false;

  void initState(){
    setState(() {
      _light = widget.initialValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SwitchListTile(
      activeColor: Colors.white,
      activeTrackColor: Colors.green,
      inactiveTrackColor: Colors.white,
      inactiveThumbColor: Colors.green,
      value: _light,
      onChanged: (bool value){
        setState((){
          _light = value; 
        });
      },
      secondary: Image.asset('assets/leaf.png',width: 30,height: 30,),
      title:  Text(
        widget.title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: 'Poppins'
        ),
      ),
      subtitle:  Text(
        _light? "ON" : "OFF",
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontFamily: 'Poppins'
        ),
      ),
    );
  }
}