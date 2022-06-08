import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Column(
              children: const [
                Text("Suman"),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                children: const [
                  Text(
                      "HiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHi"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
