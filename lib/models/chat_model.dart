class Chat {
  Chat();
  final List<String> _chatTraining = [
    "ออกกำลังกายบนเตียง",
    "การฟื้นฟูสมรรถภาพปอด",
    "การดูแลสายระบาย",
    "การปฎิบัติตัวที่เหมาะสมก่อนกลับบ้าน",
    "การส่งเสริมการหายของแผล",
    "การลุกออกจากเตียง",
    "การปฎิบัติกิจวัตรประจำวัน",
    "แบบประเมินก่อนกลับบ้าน",
    "ไม่ลุกเดินหลังผ่าตัด",
  ];

  final List<String> _optionList = [
    "รับประทานอาหาร",
    "อาบน้ำ",
    "ดูแลแผล",
    "แผลบวม",
    "ท้องอืด",
    "ไอบ่อย",
    "ลืมทานยา",
    "เลื่อนนัด"
  ];
  bool result;

  List<String> getChatTraining() {
    return this._chatTraining;
  }

  List<String> getOptionList() {
    return this._optionList;
  }
}
