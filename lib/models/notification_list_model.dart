class NotiData {
  String patientState;
  String formName;
  String formTime;
  String formDate;
  DateTime formDateTimeSort;
  String imgURL;
  String advice;
  String severity;
  String notiId;
  String patientSeen;
  Map<String, dynamic> map;

  NotiData({
    this.map,
  }) {
    this.patientState = map['patientState'];
    this.formName = map['formName'];
    this.formTime = map['formTime'];
    this.formDate = map['formDate'];
    this.formDateTimeSort = map["formDateTimeSort"];
    this.imgURL = map['imgURL'];
    this.advice = map['advice'];
    this.severity = map['severity'];
    this.notiId = map['notiId'];
    this.patientSeen = map['patientSeen'];
  }
}
