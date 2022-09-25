import 'dart:async';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';

//void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ScanResult? scanResult;

  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

  @override
  Widget build(BuildContext context) {
    final scanResult = this.scanResult;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: const Text('QR Code Scanner'),
            // actions: [
            //   IconButton(
            //     icon: const Icon(Icons.camera),
            //     tooltip: 'Scan',
            //     onPressed: _scan,
            //   )
            //],
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: _scan,
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(
                      Icons.camera,
                      size: 24.0,
                    ),
                    Text('Click Me!'),
                  ]),
                ),
                // ListView(
                //   scrollDirection: Axis.vertical,
                //   //shrinkWrap: true,
                //   children: <Widget>[
                //     if (scanResult != null)
                //       Card(
                //         child: Column(
                //           children: <Widget>[
                //             ListTile(
                //               title: const Text('Result Type'),
                //               subtitle: Text(scanResult.type.toString()),
                //             ),
                //             ListTile(
                //               title: const Text('Raw Content'),
                //               subtitle: Text(scanResult.rawContent),
                //             ),
                //             ListTile(
                //               title: const Text('Format'),
                //               subtitle: Text(scanResult.format.toString()),
                //             ),
                //             ListTile(
                //               title: const Text('Attendance'),
                //               subtitle: Text(
                //                 'Registered',
                //                 style: TextStyle(color: Colors.lightGreen),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //   ],
                // ),
              ])),
    );
  }

  _scan() async {
    final result = await BarcodeScanner.scan(
      options: ScanOptions(
        strings: {
          'cancel': _cancelController.text,
          'flash_on': _flashOnController.text,
          'flash_off': _flashOffController.text,
        },
      ),
    );
    setState(() => scanResult = result);
  }
}
