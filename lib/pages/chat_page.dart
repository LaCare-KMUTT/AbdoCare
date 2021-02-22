import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

import '../widget/chatbot/buttom_nav_bar.dart';
import 'test.dart';

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
  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/abdo-bot-briv-9ed7278f51f5.json")
            .build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.thai);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(0, {"data": 0, "message": aiResponse.getMessage()});
    });
    print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AbdoCare",
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.help,
              size: 30,
            ),
            tooltip: 'ช่วยเหลือ',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
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
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) {
                      return chat(messsages[index]["message"],
                          messsages[index]["data"]);
                    })),
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
                                  messsages
                                      .insert(0, {"data": 1, "message": item});
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
            ListTile(
              title: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.only(left: 15),
                child: TextField(
                  controller: messageInsert,
                  decoration: InputDecoration(
                    hintText: "พิมพ์ข้อความ...",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  onChanged: (value) {},
                ),
              ),
              trailing: IconButton(
                  icon: Icon(
                    Icons.send,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    if (messageInsert.text.isEmpty) {
                      print("empty message");
                    } else {
                      setState(() {
                        messsages.insert(
                            0, {"data": 1, "message": messageInsert.text});
                      });
                      response(messageInsert.text);
                      messageInsert.clear();
                    }
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtomNavBar(),
    );
  }

  Widget chat(dynamic message, int data) => Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Row(
          mainAxisAlignment:
              data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            data == 0
                ? Container(
                    height: 30,
                    width: 30,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/robot.jpg"),
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Bubble(
                  radius: Radius.circular(15.0),
                  color: data == 0 ? Color(0xFFF1B43F) : Color(0xFFFCECBC),
                  elevation: 0.0,
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                            child: Container(
                          constraints: BoxConstraints(maxWidth: 200),
                          child: Text(
                            message,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
            data == 1
                ? Container(
                    height: 30,
                    width: 30,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/default.jpg"),
                    ),
                  )
                : Container(),
          ],
        ),
      );
}
