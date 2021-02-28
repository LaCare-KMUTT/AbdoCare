class Chat {
  Chat();
  final List<String> _chatTraining = [
    "ออกกำลังกายบนเตียง",
    "การฟื้นฟูสมรรถภาพปอด",
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
