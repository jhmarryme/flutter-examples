import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightSynopsisCard extends StatelessWidget {
  const FlightSynopsisCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // go to flight detail route
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //logo
              Image(
                  image: const AssetImage('assets/images/mock/VJ-1.png'),
                  width: 1.sw * 0.11,
                  height: 1.sh * 0.05,
                  fit: BoxFit.fill),
              Container(
                width: 1.sw * 0.35,
                height: 1.sh * 0.1,
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //flight time
                        const Text('9:35', style: TextStyle(fontSize: 17)),
                        Transform.rotate(
                            angle: pi / 2, child: const Icon(Icons.flight)),
                        //landing time
                        const Text('13:35', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                    //airline
                    const Text(
                      'SIN -HAN, Vietjet Ari',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),

              //direct flight, 3h 20m
              Container(
                width: 1.sw * 0.3,
                height: 1.sh * 0.1,
                padding: const EdgeInsets.only(top: 6),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('directflight', style: TextStyle(fontSize: 12)),
                    Text('3h 20m', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
