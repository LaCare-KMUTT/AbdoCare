import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

import '../widget/chatbot/buttom_nav_bar.dart';
import '../widget/chatbot/chat_training.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);

// This widget is the home page of your application. It is stateful, meaning
// that it has a State object (defined below) that contains fields that affect
// how it looks.

// This class is the configuration for the state. It holds the values (in this
// case the title) provided by the parent (in this case the App widget) and
// used by the build method of the State. Fields in a Widget subclass are
// always marked "final".

  final String title;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<dynamic> _messages = <dynamic>[];
  List<String> chatTraining = [
    "ออกกำลังกายบนเตียง",
    "การฟื้นฟูสมรรถภาพปอด",
  ];
  bool result = false;
  final TextEditingController _textController = TextEditingController();
  List<String> optionlist = [
    "รับประทานอาหาร",
    "อาบน้ำ",
    "ดูแลแผล",
    "แผลบวม",
    "ท้องอืด",
    "ไอบ่อย",
    "ลืมทานยา",
    "เลื่อนนัด"
  ];
  BuildContext buildContext;
  @override
  Widget build(BuildContext context) {
    this.buildContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Abdocare"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.help,
              size: 30,
            ),
            tooltip: 'ช่วยเหลือ',
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.account_circle,
            size: 30,
          ),
          tooltip: 'โปรไฟล์',
          onPressed: () {
            setState(() {});
            Navigator.pushNamed(context, '/profile_page');
          },
        ),
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
          reverse: true,
          itemBuilder: (context, index) => _messages[index],
          itemCount: _messages.length,
        )),
        Container(
          height: 40.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
                  for (var item in optionlist)
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ActionChip(
                          backgroundColor: Color(0xFFF1B43F),
                          label: Text(item),
                          onPressed: () {
                            setState(() {
                              _messages.insert(
                                0,
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 250),
                                            decoration: BoxDecoration(
                                                color: Color(0xFFFCECBC),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15.0))),
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                item,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 5.0),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/default.jpg"),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                            response(item);
                          }),
                    ),
                ],
              )
            ],
          ),
        ),
        Divider(
          height: 5.0,
          color: Color(0xFFC37447),
        ),
        Container(
          child: _buildTextComposer(),
        ),
      ]),
      bottomNavigationBar: ButtomNavBar(),
    );
  }

  Widget _buildTextComposer() {
    return ListTile(
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.grey[300],
        ),
        padding: EdgeInsets.only(left: 15),
        child: TextField(
          controller: _textController,
          onSubmitted: _handleSubmitted,
          decoration: InputDecoration(
            hintText: "พิมพ์ข้อความ...",
            hintStyle: TextStyle(color: Colors.black26),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
      trailing: IconButton(
          icon: Icon(
            Icons.send,
            size: 30.0,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            if (_textController.text.isEmpty) {
              print("empty message");
            } else {
              _handleSubmitted(_textController.text);
            }
          }),
    );
  }

  void response(dynamic query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/abdo-bot-briv-9ed7278f51f5.json")
            .build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle);
    AIResponse response = await dialogflow.detectIntent(query);
    for (var i = 0; i < chatTraining.length; i++) {
      if (response.getMessage() == chatTraining[i]) {
        result = true;
        setState(() {
          _messages.insert(0, ChatTraining(answer: response.getMessage()));
        });
        break;
      } else {
        result = false;
      }
    }
    if (response.getMessage() != null &&
        response.getMessage() != "" &&
        result == false) {
      SimpleMessage message = SimpleMessage(
        text: response.getMessage(),
        name: "Bot",
        type: false,
      );
      setState(() {
        _messages.insert(0, message);
      });
    }
  }

  void _handleSubmitted(String text) {
    if (text.isEmpty) {
      print("empty message");
    } else {
      SimpleMessage message = SimpleMessage(
        text: text,
        name: "Patient",
        type: true,
      );
      setState(() {
        _messages.insert(0, message);
      });
      response(text);
      _textController.clear();
    }
  }
}

class SimpleMessage extends StatelessWidget {
  SimpleMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(dynamic context) {
    return <Widget>[
      Container(
        child: CircleAvatar(
          child: Image.asset("assets/robot.jpg"),
          backgroundColor: Colors.transparent,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxWidth: 250),
                decoration: BoxDecoration(
                    color: Color(0xFFF1B43F),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> myMessage(dynamic context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxWidth: 250),
              decoration: BoxDecoration(
                  color: Color(0xFFFCECBC),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 5.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/default.jpg"),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
