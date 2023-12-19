import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  double _currentSliderValue1 = 1;
  double _currentSliderValue2 = 1;
  double _currentSliderValue3 = 1;
  var _currentSliderValue4 = RangeValues(1, 24);
  var _currentSliderValue5 = RangeValues(1, 24);
  var _currentSliderValue6 = RangeValues(1, 24);
  var _currentSliderValue7 = RangeValues(1, 24);

  bool monVal = false;

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 3.0,
            leading: InkWell(
              child: Icon(
                Icons.arrow_back_ios_rounded,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              'Filter',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
            actions: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 1.sh * 0.1),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      top: 1.sh * 0.02,
                      bottom: 1.sh * 0.01,
                      left: 1.sw * 0.02,
                      right: 1.sw * 0.02,
                    ),
                    child: Text(
                      'Stops',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 1.sh * 0.01,
                      left: 1.sw * 0.02,
                      right: 1.sw * 0.02,
                    ),
                    height: 1.sh * 0.06,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: GestureDetector(
                            onTap: () => setState(() => _value = 0),
                            child: Container(
                              width: 1.sw * 0.30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                'Any',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 1.sw * 0.30,
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: GestureDetector(
                            onTap: () => setState(() => _value = 1),
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                'Nonstop',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: GestureDetector(
                            onTap: () => setState(() => _value = 2),
                            child: Container(
                              width: 1.sw * 0.30,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                'Stops',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: GestureDetector(
                            onTap: () => setState(() => _value = 3),
                            child: Container(
                              width: 1.sw * 0.30,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(width: 1),
                              ),
                              child: Text(
                                '1Stop',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: GestureDetector(
                            onTap: () => setState(() => _value = 4),
                            child: Container(
                              width: 1.sw * 0.35,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(width: 1),
                              ),
                              child: Text(
                                '2Stop',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,

                                // spreadRadius: 6,

                                blurRadius: 15,

                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Duration',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                ),
                                height: 1,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0),
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        'maxTravelTime',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Text(
                                                'upTo',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 3,
                                                  right: 3,
                                                ),
                                                child: Text(
                                                  '${_currentSliderValue1.toInt()}',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'hours',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Text(
                                              '(309 of 412 flights)',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Slider(
                                        value: _currentSliderValue1,
                                        min: 0,
                                        max: 412,
                                        label: _currentSliderValue1
                                            .round()
                                            .toString(),
                                        onChanged: (double value) {
                                          setState(() {
                                            _currentSliderValue1 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        'Stopover',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            '${_currentSliderValue2.toInt()}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            '25Hours',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Slider(
                                        value: _currentSliderValue2,
                                        min: 1,
                                        max: 25,
                                        label: _currentSliderValue2
                                            .round()
                                            .toString(),
                                        onChanged: (double value) {
                                          setState(() {
                                            _currentSliderValue2 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,

                                // spreadRadius: 6,

                                blurRadius: 15,

                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                ),
                                height: 1,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0,
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            '${_currentSliderValue3.toInt()}đ',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            ' - 8.000.000đ',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Slider(
                                        value: _currentSliderValue3,
                                        min: 1,
                                        max: 8000000,
                                        label: _currentSliderValue3
                                            .round()
                                            .toString(),
                                        onChanged: (double value) {
                                          setState(() {
                                            _currentSliderValue3 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 1.sh * 0.03,
                            bottom: 1.sh * 0.03,
                          ),
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,

                                // spreadRadius: 6,

                                blurRadius: 15,

                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Bags',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                ),
                                height: 1,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0,
                                  ),
                                ),
                              ),
                              Container(
                                child: ListTile(
                                  leading: Checkbox(
                                    value: monVal,
                                    onChanged: (bool? value) {},
                                  ),
                                  title: Container(
                                    // width: 1.sw * 0.9,
                                    child: Text(
                                      'includeFlightsWithoutCheckedBaggage',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,

                                // spreadRadius: 6,

                                blurRadius: 15,

                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Departuretime',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                ),
                                height: 1,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0,
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        'Departuretime',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '${_currentSliderValue4.start.toInt()}' +
                                                ":00",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 3,
                                              right: 3,
                                            ),
                                            child: Text(
                                              "-",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${_currentSliderValue4.end.toInt()}' +
                                                ":00",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: RangeSlider(
                                        // divisions: 24,
                                        values: _currentSliderValue4,
                                        labels: RangeLabels(
                                          _currentSliderValue4.start
                                              .round()
                                              .toString(),
                                          _currentSliderValue4.end
                                              .round()
                                              .toString(),
                                        ),
                                        min: 1,
                                        max: 24,
                                        onChanged: (RangeValues values) {
                                          setState(() {
                                            _currentSliderValue4 = values;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        'Arrivaltime',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '${_currentSliderValue5.start.toInt()}' +
                                                ":00",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 3,
                                              right: 3,
                                            ),
                                            child: Text(
                                              "-",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${_currentSliderValue5.end.toInt()}' +
                                                ":00",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: RangeSlider(
                                        // divisions: 24,
                                        values: _currentSliderValue5,
                                        labels: RangeLabels(
                                          _currentSliderValue5.start
                                              .round()
                                              .toString(),
                                          _currentSliderValue5.end
                                              .round()
                                              .toString(),
                                        ),
                                        min: 1,
                                        max: 24,
                                        onChanged: (RangeValues values) {
                                          setState(() {
                                            _currentSliderValue5 = values;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,

                                // spreadRadius: 6,

                                blurRadius: 15,

                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Returntime',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                ),
                                height: 1,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0,
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        'Departuretime',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '${_currentSliderValue6.start.toInt()}' +
                                                ":00",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 3,
                                              right: 3,
                                            ),
                                            child: Text(
                                              "-",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${_currentSliderValue6.end.toInt()}' +
                                                ":00",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: RangeSlider(
                                        // divisions: 24,
                                        values: _currentSliderValue6,
                                        labels: RangeLabels(
                                          _currentSliderValue6.start
                                              .round()
                                              .toString(),
                                          _currentSliderValue6.end
                                              .round()
                                              .toString(),
                                        ),
                                        min: 1,
                                        max: 24,
                                        onChanged: (RangeValues values) {
                                          setState(() {
                                            _currentSliderValue6 = values;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        'Arrivaltime',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '${_currentSliderValue7.start.toInt()}' +
                                                ":00",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 3,
                                              right: 3,
                                            ),
                                            child: Text(
                                              "-",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${_currentSliderValue7.end.toInt()}' +
                                                ":00",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: RangeSlider(
                                        // divisions: 24,
                                        values: _currentSliderValue7,
                                        labels: RangeLabels(
                                          _currentSliderValue7.start
                                              .round()
                                              .toString(),
                                          _currentSliderValue7.end
                                              .round()
                                              .toString(),
                                        ),
                                        min: 1,
                                        max: 24,
                                        onChanged: (RangeValues values) {
                                          setState(() {
                                            _currentSliderValue7 = values;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 1.sh * 0.05,
                      bottom: 1.sh * 0.05,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          // spreadRadius: 6,
                          blurRadius: 15,
                          offset: Offset(15, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'Carriers',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                subtitle: Text(
                                  "Any",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.navigate_next,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 1.sw * 0.05,
                                ),
                                child: Divider(
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'Airports',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                subtitle: Text(
                                  "Any",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.navigate_next,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 1.sw * 0.05,
                                ),
                                child: Divider(
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'Class',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                subtitle: Text(
                                  "Economy/Premium",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.navigate_next,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 1.sw * 0.05,
                                ),
                                child: Divider(
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'StopoverCity',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                subtitle: Text(
                                  "Any",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.navigate_next,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 1.sw * 0.05,
                                ),
                                child: Divider(
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'Excludecountries',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                subtitle: Text(
                                  "Any",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.navigate_next,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 1.sw * 0.05,
                                ),
                                child: Divider(
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'PlanModel',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                subtitle: Text(
                                  "Any",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.navigate_next,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 1.sw * 0.05,
                                ),
                                child: Divider(
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: BottomAppBar(
          child: Container(
            height: 1.sh * 0.08,
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  // spreadRadius: 6,
                  blurRadius: 15,
                  offset: Offset(10, 0),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                minimumSize: Size(
                  500,
                  1.sh * 0.05,
                ),
              ),
              child: Text(
                'Apply',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
