import 'package:flutter/material.dart';
import 'GenerateQR.dart';
import 'ScanQR.dart';

class HomPage extends StatefulWidget {
  const HomPage({super.key});

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => App()));
              },
              child: Row(
                children: [
                  Icon(Icons.camera),
                  Text(
                    'Scan QR code',
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                ],
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GenerateQR()));
              },
              child: Row(
                children: [
                  Icon(Icons.qr_code),
                  Text(
                    "Generate QR code",
                    style: TextStyle(color: Colors.amber),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
