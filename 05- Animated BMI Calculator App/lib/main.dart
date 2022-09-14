import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

//https://help.syncfusion.com/flutter/radial-gauge/needle-pointer

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  TextEditingController hController = new TextEditingController();
  TextEditingController wController = new TextEditingController();
  double bmi = 0;
  bool isVisible = false;
  String s = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo[700],
            title: Center(
          child: Text('BMI Calculator'),
        )),
        body: Container(
            margin: EdgeInsets.only(top: 30),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Colors.indigo[900]
                          ),
                          controller: wController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            hintText: '72.5 kg',
                            hintStyle: TextStyle(
                              color: Colors.grey[500]
                            ),
                            labelStyle:TextStyle(
                                color: Colors.indigo[700]
                            ),

                            labelText: 'Enter your Weight:',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        width: 300,
                        child: TextField(
                            keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Colors.indigo[900]
                          ),
                          controller: hController,

                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            hintText: '180 cm ',
                            labelText: 'Enter your Height:',
                            hintStyle: TextStyle(
                                color: Colors.grey[500]
                            ),
                            labelStyle:TextStyle(
                                color: Colors.indigo[700]
                            ),
                          ),
                        ),
                      ),
                      Center(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(25),
                              child: SizedBox(
                                width: 120,
                                height: 45,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.indigo[800])
                                  ),
                                    onPressed: () {
                                      setState(() {
                                        double h, w;
                                        h = double.parse(hController.text) / 100;
                                        w = double.parse(wController.text);
                                         bmi = (w / (h * h));
                                        s = 'Your BMI is: ' + bmi.toStringAsFixed(2);
                                        isVisible=true;
                                      });
                                    },
                                    child: Text(
                                       'Submit',
                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                    )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(25),
                              child: SizedBox(
                                width: 120,
                                height: 45,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.indigo[800])
                                    ),
                                    onPressed: () {
                                      hController.text="";
                                      wController.text="";
                                      setState(() {
                                        isVisible=false;
                                      });
                                    },
                                    child: Text(
                                      'Reset',
                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(s,
                          style: TextStyle(color: Colors.white,fontSize:30),),
                      Visibility(
                        visible: isVisible ,
                        child: SfRadialGauge(

                          enableLoadingAnimation: true,animationDuration: 4000,
                            axes: <RadialAxis>[

                              RadialAxis(minimum: 0, maximum: 40,
                                  ranges: <GaugeRange>[
                                    GaugeRange(startValue: 0, endValue: 18.5, color:Colors.red[700],),
                                    GaugeRange(startValue: 18.5, endValue: 24.9, color:Colors.lightGreen[800]),
                                    GaugeRange(startValue: 25,endValue: 29.9,color: Colors.orange[700]),
                                    GaugeRange(startValue: 30,endValue: 39.9,color: Colors.red[800])],
                                  pointers: <GaugePointer>[
                                    NeedlePointer(value: bmi), ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(widget: Container(child:
                                    Text(bmi.toStringAsFixed(2),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black))),
                                        angle: 90, positionFactor: 0.5
                                    )]
                              )]),
                      )


                    ],
                  ),
                ),
              ),

          ),

      ),
    );
  }
}
