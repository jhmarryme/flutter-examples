import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  // final bool? topRadio;
  // final bool? bootomRadio;

  const GridCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text('data'),
                      Image.network(
                          'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-hotel.png'),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text('data'),
                      Image.network(
                          'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-hotel.png'),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text('data'),
                      Image.network(
                          'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-hotel.png'),
                    ],
                  ),
                ))
          ],
        ),
      ],
    );
  }
}

class GridCardModel {
  // final String? icon;
}
