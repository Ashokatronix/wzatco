import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';
import 'remote_patterns.dart';


void main() {
  runApp(TVRemoteApp());
}

class TVRemoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TV Remote',
      home: TVRemoteScreen(),
    );
  }
}

class TVRemoteScreen extends StatefulWidget {
  @override
  _TVRemoteScreenState createState() => _TVRemoteScreenState();
}

class _TVRemoteScreenState extends State<TVRemoteScreen> {
  String _platformVersion = 'Unknown';
  bool _hasIrEmitter = false;
  String _getCarrierFrequencies = 'Unknown';

  bool _showBlinkDot = false; // Controls visibility of the red dot

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    bool hasIrEmitter;
    String getCarrierFrequencies;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await IrSensorPlugin.platformVersion;
      hasIrEmitter = await IrSensorPlugin.hasIrEmitter;
      getCarrierFrequencies = await IrSensorPlugin.getCarrierFrequencies;
    } on PlatformException {
      platformVersion = 'Failed to get data in a platform.';
      hasIrEmitter = false;
      getCarrierFrequencies = 'None';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _hasIrEmitter = hasIrEmitter;
      _getCarrierFrequencies = getCarrierFrequencies;
    });
  }
  void _blinkRedDot() {
    int blinkCount = 0;
    setState(() {
      _showBlinkDot = true;
    });

    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _showBlinkDot = !_showBlinkDot;
      });

      blinkCount++;
      if (blinkCount >= 6) { // 3 full blinks (on and off count as one cycle)
        timer.cancel();
        setState(() {
          _showBlinkDot = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WZATCO'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display platform info
          Text('Platform Version: $_platformVersion'),
          Text('Has IR Emitter: $_hasIrEmitter'),
          Text('Carrier Frequencies: $_getCarrierFrequencies'),
          SizedBox(height: 20),

          // Row 1: Power On/Off and Mute
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: PowerOnOff);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('Power On/Off'),
              ),
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: Mute);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('Mute'),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Row 2: Settings, Mode, and Source
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: Settings);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('Settings'),
              ),
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: Mode);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('Mode'),
              ),
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: Source);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('Source'),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Row 3: Up Arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: UpArrow);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('↑'),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Row 4: Left Arrow, OK, and Right Arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: LeftArrow);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('←'),
              ),
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: OK);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('OK'),
              ),
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: RightArrow);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('→'),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Row 5: Down Arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: DownArrow);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('↓'),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Row 6: Menu, Home, and Return
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: Menu);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('Menu'),
              ),
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: Home);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('Home'),
              ),
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: Return);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('Return'),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Row 7: Volume -, Play/Pause, and Volume +
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: VolumeMinus);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('Volume -'),
              ),
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: PlayPause);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Icon(Icons.play_arrow), // Play/Pause icon
              ),
              ElevatedButton(
                onPressed: () async {
                  HapticFeedback.vibrate();
                  await IrSensorPlugin.transmitString(pattern: VolumePlus);
                  // Trigger red dot blinking
                  _blinkRedDot();
                },
                child: Text('Volume +'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
