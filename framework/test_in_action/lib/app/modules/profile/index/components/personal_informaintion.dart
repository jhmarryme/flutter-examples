import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_in_action/common/constants/colors.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyle.kWhite,
      padding: EdgeInsets.only(
          left: 12.spMin, right: 30.spMin, top: 12.spMin, bottom: 12.spMin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Ten va nut
              Row(
                children: <Widget>[
                  Text(
                    'Ha Van Long',
                    style:
                        TextStyle(fontSize: 18.spMin, color: ColorStyle.kBlack),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Icon(Icons.navigate_next,
                        color: ColorStyle.kGrey400),
                  ),
                ],
              ),
              //Dia chi
              Text(
                'HaNoi, VietNam',
                style:
                    TextStyle(fontSize: 13.spMin, color: ColorStyle.kGrey400),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: ClipOval(
              child: Image(
                width: 80.spMin,
                height: 80.spMin,
                image: const AssetImage('assets/images/avatar.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
