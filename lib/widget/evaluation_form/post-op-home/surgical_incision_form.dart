import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/interfaces/storage_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../../stores/user_store.dart';
import 'post-op-home_page.dart';

class SurgicalIncisionForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SurgicalIncisionFormState();
  }
}

class _SurgicalIncisionFormState extends State<SurgicalIncisionForm> {
  File _image;
  final picker = ImagePicker();
  var _value = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _anSubCollection;

  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final ICalculationService _calculationService =
      locator<ICalculationService>();
  final IStorageService _storageService = locator<IStorageService>();

  Future<void> getImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print('_image ====== $_image');
      } else {
        print('No image selected.');
      }
    });
  }

  void initData() async {
    _anSubCollection = await _firebaseService.getLatestAnSubCollection(
        userId: UserStore.getValueFromStore('storedUserId'));
    print('_anSubCollectionHere $_anSubCollection');
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('แผลผ่าตัด'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            tooltip: 'กลับ',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostOpHomePage()),
              );
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Text('ทำเครื่องหมาย √ ในข้อที่ท่านมีอาการ'),
                      CheckboxListTile(
                        value: _value,
                        selected: _value,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Color(0xFFC37447),
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                            _value3 = false;
                            _value4 = false;
                          });
                        },
                        title: Text('1. แผลผ่าตัดบวมมาก'),
                      ),
                      CheckboxListTile(
                        value: _value2,
                        selected: _value2,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Color(0xFFC37447),
                        onChanged: (value) {
                          setState(() {
                            _value2 = value;
                            _value3 = false;
                            _value4 = false;
                          });
                        },
                        title: Text('2. มีหนองไหลจากแผลผ่าตัด'),
                      ),
                      CheckboxListTile(
                        value: _value3,
                        selected: _value3,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Color(0xFFC37447),
                        onChanged: (value) {
                          setState(() {
                            _value3 = value;
                            _value = false;
                            _value2 = false;
                            _value4 = false;
                          });
                        },
                        title: Text('3. แผลผ่าตัดแห้งดี'),
                      ),
                      CheckboxListTile(
                        value: _value4,
                        selected: _value4,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Color(0xFFC37447),
                        onChanged: (value) {
                          setState(() {
                            _value4 = value;
                            _value = false;
                            _value2 = false;
                            _value3 = false;
                          });
                        },
                        title: Text('4. ไม่ทราบ ต้องการให้พยาบาลประเมินแผล'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                      child: Text('สำเร็จ',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      color: Color(0xFF2ED47A),
                      onPressed: () async {
                        Map<String, dynamic> formDataToDB = {
                          'Choice1': _value,
                          'Choice2': _value2,
                          'Choice3': _value3,
                          'Choice4': _value4,
                        };
                        var formId =
                            await _firebaseService.addDataToFormsCollection(
                                formName: 'Surgical Incision',
                                data: formDataToDB);
                        if (_value | _value2 == true) {
                          showAdvise1(context);
                        }
                        if (_value3 == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdvisePage()));
                        }
                        if (_value4 == true) {
                          await showAdvise2(context, formId);
                        } else if (_value | _value2 | _value3 | _value4 ==
                            false) {
                          alert(context);
                        }
                      }),
                ],
              ),
            )
          ],
        ),
      );

  void alert(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("ทำเครื่องหมาย √ \nในข้อที่ท่านมีอาการ",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center),
          );
        });
  }

  void showAdvise1(BuildContext context) {
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("แจ้งเตือน", style: Theme.of(context).textTheme.bodyText2),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("ให้ผู้ป่วยมาพบแพทย์ทันที",
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ],
      ),
      actions: [
        RaisedButton(
          color: Color(0xFFC37447),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "ตกลง",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostOpHomePage()),
            );
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  void showAdvise2(BuildContext context, String formId) {
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("ให้ผู้ป่วยส่งรูปแผลของตน",
              style: Theme.of(context).textTheme.bodyText2),
          Text("เพื่อให้พยาบาลประเมิน",
              style: Theme.of(context).textTheme.bodyText2),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: _image == null
                      ? Image.asset(
                          'assets/image.png',
                          height: 100,
                          width: 100,
                        )
                      : Image.file(
                          _image,
                          height: 100,
                          width: 100,
                        ),
                ),
                IconButton(
                    icon: Icon(Icons.add_a_photo),
                    iconSize: 40,
                    onPressed: () => getImage(ImageSource.camera))
              ],
            ),
          ),
        ],
      ),
      actions: [
        RaisedButton(
          color: Color(0xFFC37447),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "ตกลง",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          onPressed: () async {
            String imgUrl =
                await _storageService.uploadImageToFirebase(imageFile: _image);
            var state = _anSubCollection['state'];
            var dataToDb = {
              'creation': _calculationService.formatDate(date: DateTime.now()),
              'formName': 'Surgical Incision',
              'formId': formId,
              'userId': UserStore.getValueFromStore('storedUserId'),
              'seen': false,
              'patientState': state,
              'photoURL': imgUrl,
            };
            await _firebaseService.addNotification(dataToDb);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostOpHomePage()),
            );
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }
}

//Show Advise information
class AdvisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("คำแนะนำ"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          tooltip: 'กลับ',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostOpHomePage()),
            );
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                              '''การดูแลเพื่อส่งเสริมการหายของแผลและป้องกันการติดเชื้อที่แผลผ่าตัด มีดังนี้'''),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                  '''1. ให้ผู้ป่วยพักผ่อนให้เพียงพออย่างน้อยวันละ 8 ชั่วโมง เพื่อลดกระบวนการเผาผลาญภายในเซลล์ที่ไม่จำเป็น เนื้อเยื่อสามารถนำออกซิเจนและสารอาหารไปใช้ได้เพียงพอ''',
                                  style: Theme.of(context).textTheme.bodyText1),
                              Text(
                                  '''2. ดูแลทำความสะอาดแผลอย่างถูกวิธี และหลีกเลี่ยงการใช้มือสัมผัสกับแผลผ่าตัด เพื่อลดการติดเชื้อที่แผลผ่าตัด''',
                                  style: Theme.of(context).textTheme.bodyText1),
                              Text('3. การรับประทานอาหาร ',
                                  style: Theme.of(context).textTheme.bodyText1),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                        '''3.1 รับประทานอาหารประเภทโปรตีน เช่น ไข่ขาว เนื้อไก่เนื้อปลา''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    Text(
                                        '''3.2 รับประทานอาหารที่มีวิตามินซีสูง เช่น ผลไม้รสเปรี้ยว และผักใบเขียว''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                ),
                              ),
                              Text(
                                  '''4. ระมัดระวังไม่ให้แผลโดนน้ำ อาจใช้ถุงพลาสติกสะอาดปิดคลุมบริเวณแผลขณะอาบน้ำเพื่อป้องกันการซึมของน้ำเข้าแผลผ่าตัด''',
                                  style: Theme.of(context).textTheme.bodyText1),
                              Text(
                                  '''5. เมื่อแผลเริ่มแห้ง อาจเกิดสะเก็ดแผล ควรหลีกเลี่ยงการแกะหรือเกาแผล เพื่อป้องกันการฉีกขาดของแผลเพิ่มขึ้น''',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                              '''การดูแลแผลผ่าตัด การทำแผล มีวิธีการทำแผลดังนี้'''),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                  '''1. หากผู้ป่วยอยู่ใกล้กับสถานพยาบาลหรือมีความสะดวกในการเดินทางไปยังสถานพยาบาล เช่น โรงพยาบาล ศูนย์ส่งเสริมสุขภาพตำบล หรือ คลินิก แนะนำให้ผู้ป่วยไปทำแผลในสถานพยาบาลใกล้บ้านนั้น''',
                                  style: Theme.of(context).textTheme.bodyText1),
                              Text(
                                  '''2. กรณีที่ผู้รับบริการต้องการทำแผลเองปฏิบัติ ดังนี้''',
                                  style: Theme.of(context).textTheme.bodyText1),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                        '''2.1 จัดเตรียมอุปกรณ์สำหรับทำแผล ได้แก่ ชุดทำแผล และ น้ำยาสำหรับทำความสะอาดแผล พลาสเตอร์ หรือแผ่นผิดแผลกันน้ำ''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    Text(
                                        '''2.2 ล้างมือด้วยน้ำสบู่ หรือ แอลกอฮอล์เจล ให้สะอาดทุกครั้งก่อนการทำแผล''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    Text(
                                        '''2.3 เปิดชุดทำแผลด้วยความระมัดระวังการปนเปื้อน''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    Text(
                                        '''2.4 เทน้ำยาสำหรับทำความสะอาดแผล (0.9% NSS) ลงในช่องภายในชุดทำแผล''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    Text(
                                        '''2.5 ใช้ที่คีบสำลีตัวที่ 1 จับสำลีชุบน้ำยาทำความสะอาดแผลส่งให้คีบสำลีตัวที่ 2 และเช็ดทำความสะอาดที่ขอบแผลวนออกด้านนอก 2 – 3 นิ้ว''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    Text(
                                        '''2.6 ใช้ที่คีบสำลีตัวที่ 1 จับสำลีชุบน้ำยาทำความสะอาดแผลส่งให้คีบสำลีตัวที่ 2 และเช็ดทำความสะอาดที่แผล''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    Text(
                                        '''2.7 ปฏิบัติซ้ำในข้อที่ 3.5 – 3.6 จนแผลสะอาด''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    Text(
                                        '''2.8 ปิดแผลด้วยผ้าก็อซที่มีให้ในชุดทำแผล''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
}
