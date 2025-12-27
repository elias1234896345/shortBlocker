import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
   
      ),
      home: const MyHomePage(title: 'Shor Blocker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueChanged<double>? get onChanged => null;
  
 bool _pressedStart = true;
  
  Widget slider = SleekCircularSlider(
    appearance: CircularSliderAppearance(
      size: 350,
      startAngle: 270,
      angleRange: 360,
      
      customWidths: CustomSliderWidths( progressBarWidth: 10),
      customColors: CustomSliderColors(trackColor: Colors.lightBlueAccent, progressBarColors:[Colors.lightGreen, Colors.amberAccent], shadowMaxOpacity: 20.0 ),
      infoProperties: InfoProperties(
        bottomLabelText: 'MIN',
        bottomLabelStyle: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        modifier: (double value){
          return'${value.toInt()}';
        }
      ),
    ),
    initialValue: 5,
    onChange: (double value){
      print(value);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shortt Blocker')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //circular slider
          slider,
        
        SizedBox(height: 30,),

          //Buttons
          Column(
            children: [
            _pressedStart ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, 
                      minimumSize: const Size(250, 100),
                    ),
                    onPressed: () {
                      setState(() {
                         _pressedStart = false;
                      });
                    }, 
                    child: Text('Start', style: TextStyle(fontSize: 30, color: Colors.white), ) 
                  )
              ],
              )
              :
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.red, 
                      minimumSize: const Size(250,100)),
                    onPressed: () {
                      setState(() {
                         _pressedStart = true;
                      });
                    }, 
                    child: Text('Stop', style: TextStyle(fontSize: 30, color: Colors.white),) 
                  )
              ],
              )
            ]
          ),
    ]));
  }
}
