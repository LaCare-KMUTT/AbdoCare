import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

import '../models/chat_model.dart';
import '../models/message_model.dart';
import '../services/service_locator.dart';
import '../widget/chatbot/buttom_nav_bar.dart';
import '../widget/chatbot/chat_training.dart';
import '../widget/chatbot/message.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Chat _chat = locator<Chat>();
  final _messageModel = locator<MessageModel>();
  final TextEditingController _textController = TextEditingController();

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
          itemBuilder: (context, index) => _messageModel.messages[index],
          itemCount: _messageModel.messages.length,
        )),
        Container(
          height: 40.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Row(
                children: <Widget>[
                  for (var item in _chat.getOptionList())
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ActionChip(
                          backgroundColor: Color(0xFFF1B43F),
                          label: Text(item),
                          onPressed: () {
                            setState(() {
                              _messageModel.insertMessage(
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
                                            AssetImage("assets/user.png"),
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
    List<String> chatTraining = _chat.getChatTraining();
    for (var i = 0; i < chatTraining.length; i++) {
      if (response.getMessage() == chatTraining[i]) {
        _chat.result = true;
        // result = true;
        setState(() {
          _messageModel.insertMessage(
              0, ChatTraining(answer: response.getMessage()));
        });
        break;
      } else {
        _chat.result = false;
        // result = false;
      }
    }
    if (response.getMessage() != null &&
        response.getMessage() != "" &&
        _chat.result == false) {
      Message message = Message(
        text: response.getMessage(),
        name: "Bot",
        type: false,
      );
      setState(() {
        _messageModel.insertMessage(0, message);
      });
    }
  }

  void _handleSubmitted(String text) {
    if (text.isEmpty) {
      print("empty message");
    } else {
      Message message = Message(
        text: text,
        name: "Patient",
        type: true,
      );
      setState(() {
        _messageModel.insertMessage(0, message);
      });
      response(text);
      _textController.clear();
    }
  }
}
