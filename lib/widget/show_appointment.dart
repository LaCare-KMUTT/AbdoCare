import 'package:flutter/material.dart';

class ShowAppointment extends StatefulWidget {
  @override
  State createState() => ShowAppointmentState();
}

class ShowAppointmentState extends State<ShowAppointment> {
  List<Map<String, Object>> anotherlist = [
    {
      "date": "19 กุมภาพันธ์ 2564",
      "time": "7.00",
      "reason": "เลือด",
      "preparation": "งดน้ำงดอาหารหลัง 2 ทุ่ม"
    },
    {
      "date": "20 กุมภาพันธ์ 2564",
      "time": "8.00",
      "reason": "เลือด",
      "preparation": "งดน้ำงดอาหารหลังเที่ยงคืน"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var item in anotherlist)
          ExpansionTile(
            title: Text(
              item['date'],
              style: TextStyle(color: Color(0xFFC37447)),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'รายละเอียดการนัดหมาย',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'เวลา ${item['time']} น.',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'นัดมาตรวจ: ${item['reason']}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'การเตรียมความพร้อม: ${item['preparation']}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
      ],
    );
  }
}
