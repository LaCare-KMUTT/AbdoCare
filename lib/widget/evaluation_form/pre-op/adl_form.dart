import 'package:flutter/material.dart';

class ADLForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ADLFormState();
  }
}

class _ADLFormState extends State<ADLForm> {
  String selectedChoice = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'การปฏิบัติกิจวัตรประจำวัน',
              //style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'ข้อที่ 1 จากทั้งหมด 10 ข้อ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/icon/Feeding.png',
                  height: 150,
                  width: 150,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text('คำถามที่ 1',
                          style: Theme.of(context).textTheme.bodyText2),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'Feeding',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'รับประทานอาหารเมื่อเตรียมสำรับไว้ให้เรียบร้อยต่อหน้า',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ChoiceChip(
                    label: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้"),
                          ],
                        ),
                      ),
                    ),
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    backgroundColor: Colors.white,
                    selectedColor: Color(0xffFCE9E9),
                    selected: selectedChoice ==
                        "ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้",
                    onSelected: (selected) {
                      print(selectedChoice);
                      setState(() {
                        selectedChoice =
                            "ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้";
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ChoiceChip(
                    //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    label: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "ตักอาหารเองได้แต่ต้องมีคนช่วย เช่น ช่วยใช้ช้อนตักเตรียมไว้ให้หรือตัดเป็นเล็กๆไว้ล่วงหน้า"),
                          ],
                        ),
                      ),
                    ),
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color(0xffF2C94C),
                      ),
                    ),
                    backgroundColor: Colors.white,
                    selectedColor: Color(0xffFDF4D7),
                    selected: selectedChoice ==
                        "ตักอาหารเองได้แต่ต้องมีคนช่วย เช่น ช่วยใช้ช้อนตักเตรียมไว้ให้หรือตัดเป็นเล็กๆไว้ล่วงหน้า",
                    onSelected: (selected) {
                      setState(() {
                        selectedChoice =
                            "ตักอาหารเองได้แต่ต้องมีคนช่วย เช่น ช่วยใช้ช้อนตักเตรียมไว้ให้หรือตัดเป็นเล็กๆไว้ล่วงหน้า";
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ChoiceChip(
                    label: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("ตักอาหารและช่วยตัวเองได้เป็นปกติ"),
                          ],
                        ),
                      ),
                    ),
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Color(0xff6FCF97),
                        )),
                    backgroundColor: Colors.white,
                    selectedColor: Color(0xffE5FBEE),
                    selected:
                        selectedChoice == "ตักอาหารและช่วยตัวเองได้เป็นปกติ",
                    onSelected: (selected) {
                      setState(() {
                        selectedChoice = "ตักอาหารและช่วยตัวเองได้เป็นปกติ";
                      });
                    },
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Column(
                //     children: [
                //       FlatButton(
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10.0),
                //             side: BorderSide(color: Colors.red)),
                //         color: Colors.white,
                //         textColor: Colors.red,
                //         padding: EdgeInsets.all(5.0),
                //         onPressed: () {},
                //         child: Text(
                //           "ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้",
                //           style: TextStyle(
                //               fontSize: 16,
                //               color: Colors.black,
                //               fontWeight: FontWeight.normal),
                //         ),
                //       ),
                //       FlatButton(
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10.0),
                //             side: BorderSide(color: Colors.green)),
                //         color: Colors.white,
                //         textColor: Colors.green,
                //         padding: EdgeInsets.all(5.0),
                //         onPressed: () {},
                //         child: Text(
                //           "ตักอาหารเองได้แต่ต้องมีคนช่วย เช่น ช่วยใช้ช้อนตักเตรียมไว้ให้หรือตัดเป็นเล็กๆไว้ล่วงหน้า",
                //           style: TextStyle(
                //               fontSize: 16,
                //               color: Colors.black,
                //               fontWeight: FontWeight.normal),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
