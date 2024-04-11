// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/widgets/text/app_heading.dart';
import 'package:todo/widgets/text/app_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0.0,
        actions: const [
          Icon(CupertinoIcons.bell),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              // radius: 20.0,
              maxRadius: 15.0,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppHeading('Hello Pawan!'),
                  AppText('Welcome to your task manager')
                ],
              ),
            ),
            Container(
              height: size.height * .24,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: Card(
                // color: const Color(0xFF537c78),
                color: const Color(0xFFF14122B),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppHeading('Today\'s progress\nsummary',
                                color: Colors.white,
                                textAlign: TextAlign.start),
                            AppText('1 of 5 completed',
                                color: Colors.grey.shade100)
                          ],
                        ),
                        const Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 50.0,
                              width: 50.0,
                              child: CircularProgressIndicator(
                                value: .40,
                                strokeWidth: 12.0,
                                backgroundColor: Colors.white,
                                color: Colors.green,
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                            AppText('40%', color: Colors.white)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                    alignment: Alignment.centerLeft,
                    child: AppHeading('Task Overview')),
                Container(
                  color: Colors.blue,
                  height: 50.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        height: 20.0,
                        width: 20.0,
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
