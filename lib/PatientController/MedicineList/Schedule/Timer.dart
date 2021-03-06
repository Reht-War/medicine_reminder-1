import 'package:flutter/material.dart';
import 'package:medicine_reminder/Widgets/variables.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  String _selectedDate;
  String _dateCount;
  String _range;
  String _rangeCount;
  String filterType = "Time";
  bool isSwitched = false;

  @override
  void initState() {
    _selectedDate = '';
    _dateCount = '';
    _range = '';
    _rangeCount = '';
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff292929),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                // height: (MediaQuery.of(context).size.height) * .80,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffBB86FC), width: 1),
                  color: Color(0xff292929),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        changeFilter("Time");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                changeFilter("Time");
                              },
                              child: Text(
                                "Time",
                                style: TextStyle(color: Color(0xfff2e7fe), fontSize: 18),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                changeFilter("Time");
                              },
                              child: SizedBox(
                                height: 10,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                changeFilter("Time");
                              },
                              child: Container(
                                height: 4,
                                width: 120,
                                color: (filterType == "Time")
                                    ? Color(0xffbb86fe)
                                    : Colors.transparent,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        changeFilter("Schedule");
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  changeFilter("Schedule");
                                },
                                child: Text(
                                  "Range",
                                  style: TextStyle(color: Color(0xfff2e7fe), fontSize: 18),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  changeFilter("Schedule");
                                },
                                child: SizedBox(
                                  height: 10,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  changeFilter("Schedule");
                                },
                                child: Container(
                                  height: 4,
                                  width: 120,
                                  color: (filterType == "Schedule")
                                      ? Color(0xffbb86fe)
                                      : Colors.transparent,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (filterType == "Schedule")
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                                margin: const EdgeInsets.all(6.0),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "Multiple Dates",
                                  style: myStyle(16),
                                )),
                            Center(
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    // print(isSwitched);
                                  });
                                },
                                activeTrackColor: Colors.grey,
                                activeColor: Colors.lightBlue,
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.all(6.0),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "Range of Dates",
                                  style: myStyle(16),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        _calendarType(),
                      ],
                    ),
                  ),
                ),
              if (filterType == "Time")
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            child: SelectTime(),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value;
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }

  //calendar type
  Widget _calendarType() {
    if (isSwitched) {
      return Container(
          margin: const EdgeInsets.all(6.0),
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            monthViewSettings: DateRangePickerMonthViewSettings(
              firstDayOfWeek: 1,
              dayFormat: 'EEE',
            ),
            selectionMode: DateRangePickerSelectionMode.range,
            endRangeSelectionColor: const Color(0xff3196ae),
            rangeSelectionColor: const Color(0xff3196ae).withOpacity(0.1),
            startRangeSelectionColor: const Color(0xff3196ae),
            monthCellStyle: DateRangePickerMonthCellStyle(
                todayTextStyle: TextStyle(
                  color: Colors.black,
                ),
                todayCellDecoration: BoxDecoration(
                    color: Colors.white30,
                    border:
                    Border.all(color: const Color(0xff3196ae), width: 3),
                    shape: BoxShape.circle),
                weekendTextStyle: TextStyle(color: Color(0xff3196ae))),
          ));
    } else {
      return Container(
          margin: const EdgeInsets.all(6.0),
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            monthViewSettings: DateRangePickerMonthViewSettings(
              firstDayOfWeek: 1,
              dayFormat: 'EEE',
            ),
            selectionMode: DateRangePickerSelectionMode.multiple,
            selectionColor: const Color(0xff3196ae),
            monthCellStyle: DateRangePickerMonthCellStyle(
                todayTextStyle: TextStyle(
                  color: Colors.black,
                ),
                todayCellDecoration: BoxDecoration(
                    color: Colors.white30,
                    border:
                    Border.all(color: const Color(0xff3196ae), width: 3),
                    shape: BoxShape.circle),
                weekendTextStyle: TextStyle(color: Color(0xff3196ae))),
          ));
    }
  }
}

//select time
class SelectTime extends StatefulWidget {
  @override
  _SelectTimeState createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;
      });
    }
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.all(30.0),
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 4),
        child: FlatButton(
          color: Color(0xff3196ae),
          shape: StadiumBorder(),
          onPressed: () {
            _selectTime(context);
          },
          child: Center(
            child: Text(
              _clicked == false
                  ? "Pick Time"
                  : "${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String convertTime(String minutes) {
    if (minutes.length == 1) {
      return "0" + minutes;
    } else {
      return minutes;
    }
  }
}
