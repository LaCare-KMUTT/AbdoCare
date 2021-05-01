import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../@enum/patient_state.dart';
import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../../stores/user_store.dart';
import '../../../ultilities/form_utility/pain_form_utility/pain_form_utility.dart';
import '../../training_information/post-op-home/pain_advice.dart';
import '../../training_information/post-op-hos-day2-7/pain_advice_day2.dart';

class PainForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PainFormState();
  }
}

class _PainFormState extends State<PainForm> {
  int value = 5;
  String result = "ปวดปานกลาง";
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final ICalculationService _calculationService =
      locator<ICalculationService>();
  var _anSubCollection;

  LinearGradient gradient = LinearGradient(
    colors: <Color>[
      Colors.greenAccent[400],
      Colors.orangeAccent[400],
      Colors.redAccent[700],
    ],
  );

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    _anSubCollection = await _firebaseService.getLatestAnSubCollection(
        userId: UserStore.getValueFromStore('storedUserId'));
    print('_anSubCollectionHere $_anSubCollection');
  }

  bool checkNotificationCriteria(int score) {
    var state = _anSubCollection['state'];
    var latestStateChange = _anSubCollection['latestStateChange'].toDate();
    var dayInCurrentState = _calculationService.calculateDayDifference(
        day: latestStateChange,
        compareTo: _calculationService.formatDate(date: DateTime.now()));
    var shouldNotify = PainFormUtility()
        .withState(state)
        .withDayInState(dayInCurrentState)
        .getPainFormCriteria(score);
    print('should notify = $shouldNotify');
    return shouldNotify;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ความปวดหลังการผ่าตัด'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          tooltip: 'กลับ',
          onPressed: () {
            Navigator.pushNamed(context, '/evaluation_page');
          },
        ),
      ),
      body: Container(
        child: ListView(
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
                      Image.asset(
                        'assets/Painform.png',
                        height: 180,
                        width: 350,
                      ),
                      Column(children: [
                        Text(
                          value.toString(),
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          result,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                      ]),
                      SliderTheme(
                        data: SliderThemeData(
                          trackShape: GradientRectSliderTrackShape(
                              gradient: gradient, darkenInactive: true),
                          trackHeight: 20,
                        ),
                        child: Slider(
                          value: value.toDouble(),
                          min: 0,
                          max: 10,
                          activeColor: Colors.white,
                          onChanged: (value2) {
                            setState(() {
                              value = value2.round();
                              if (value >= 8) {
                                result = "ปวดมาก";
                              } else if (5 <= value) {
                                result = "ปวดปานกลาง";
                              } else if (1 <= value) {
                                result = "ปวดเล็กน้อย";
                              } else if (0 <= value) {
                                result = "ไม่ปวด";
                              }
                            });
                          },
                        ),
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
                        Map<String, dynamic> saveToDatabase = {
                          'pain': value,
                        };
                        var formId =
                            await _firebaseService.addDataToFormsCollection(
                                formName: 'pain', data: saveToDatabase);
                        print('Value in pain_form = $value ');
                        print('state = ${_anSubCollection['state']}');
                        if ((_anSubCollection['state'] ==
                                    'Post-Operation@Hospital' &&
                                value >= 7) ||
                            (_anSubCollection['state'] ==
                                    'Post-Operation@Home' &&
                                value >= 4)) {
                          showAdvise1(
                              context, value, _anSubCollection['state']);
                          if (checkNotificationCriteria(value)) {
                            var creation = _calculationService.formatDate(
                                date: DateTime.now());
                            var patientState = _anSubCollection['state'];
                            _firebaseService.addNotification({
                              'formName': 'pain',
                              'formId': formId,
                              'userId':
                                  UserStore.getValueFromStore('storedUserId'),
                              'creation': creation,
                              'patientState': patientState,
                              'seen': false,
                            });
                          }
                        } else {
                          showAdvise2(
                              context, value, _anSubCollection['state']);
                        }
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GradientRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  final LinearGradient gradient;
  final bool darkenInactive;
  const GradientRectSliderTrackShape(
      {this.gradient =
          const LinearGradient(colors: [Colors.lightBlue, Colors.blue]),
      this.darkenInactive = true});
  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    @required RenderBox parentBox,
    @required SliderThemeData sliderTheme,
    @required Animation<double> enableAnimation,
    @required TextDirection textDirection,
    @required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(context != null);
    assert(offset != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(enableAnimation != null);
    assert(textDirection != null);
    assert(thumbCenter != null);
    if (sliderTheme.trackHeight <= 0) {
      return;
    }
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = darkenInactive
        ? ColorTween(
            begin: sliderTheme.disabledInactiveTrackColor,
            end: sliderTheme.inactiveTrackColor)
        : activeTrackColorTween;
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation);
    final Paint inactivePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..color = inactiveTrackColorTween.evaluate(enableAnimation);
    Paint leftTrackPaint;
    Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }
    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular(trackRect.height / 2 + 1);
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
          trackRect.left,
          (textDirection == TextDirection.ltr)
              ? trackRect.top - (additionalActiveTrackHeight / 2)
              : trackRect.top,
          thumbCenter.dx,
          (textDirection == TextDirection.ltr)
              ? trackRect.bottom + (additionalActiveTrackHeight / 2)
              : trackRect.bottom,
          topLeft: (textDirection == TextDirection.ltr)
              ? activeTrackRadius
              : trackRadius,
          bottomLeft: (textDirection == TextDirection.ltr)
              ? activeTrackRadius
              : trackRadius),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
          thumbCenter.dx,
          (textDirection == TextDirection.rtl)
              ? trackRect.top - (additionalActiveTrackHeight / 2)
              : trackRect.top,
          trackRect.right,
          (textDirection == TextDirection.rtl)
              ? trackRect.bottom + (additionalActiveTrackHeight / 2)
              : trackRect.bottom,
          topRight: (textDirection == TextDirection.rtl)
              ? activeTrackRadius
              : trackRadius,
          bottomRight: (textDirection == TextDirection.rtl)
              ? activeTrackRadius
              : trackRadius),
      rightTrackPaint,
    );
  }
}

void showAdvise1(BuildContext context, int value, String patientstate) {
  String navigate = "Evaluate";
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ระดับคะแนนคือ $value",
            style: Theme.of(context).textTheme.bodyText2),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("ให้รับประทานยาแก้ปวด",
                  style: Theme.of(context).textTheme.bodyText1),
              Text("ตามคำสั่งการรักษาของแพทย์",
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ],
    ),
    actions: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFC37447),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        onPressed: () {
          if (patientstate ==
              enumToString(PatientState.postOperationHospital)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PainAdviceDay2(navigate: navigate)),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PainAdvice(navigate: navigate)),
            );
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text("การบรรเทาความปวดโดยไม่ใช้ยา",
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFC37447),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/evaluation_page');
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text("ตกลง",
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (context) => alert,
  );
}

void showAdvise2(BuildContext context, int value, String patientstate) {
  String navigate = "Evaluate";
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("ระดับคะแนนคือ $value",
            style: Theme.of(context).textTheme.bodyText2),
      ],
    ),
    actions: [
      RaisedButton(
        color: Color(0xFFC37447),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              "การบรรเทาความปวดโดยไม่ใช้ยา",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        onPressed: () {
          if (patientstate ==
              enumToString(PatientState.postOperationHospital)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PainAdviceDay2(navigate: navigate)),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PainAdvice(navigate: navigate)),
            );
          }
        },
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (context) => alert,
  );
}
