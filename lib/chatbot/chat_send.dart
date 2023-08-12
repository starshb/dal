import 'package:deliciousdal/chatbot/chat_screen.dart';
import 'package:deliciousdal/common/const/colors.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

import '../common/layout/default_layout.dart';

class ChatSend extends StatefulWidget {
  const ChatSend({super.key});

  @override
  State<ChatSend> createState() => _ChatSendState();
}

class _ChatSendState extends State<ChatSend> {
  late DialogFlowtter
      _dialogFlowtter; // late Initialization of the dialogflowtter

  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    // initializing the dialogflowtter
    // DialogFlowtter."fromFile()"이 없음 => 초기화? 인스턴스가 안 만들어짐
    // DialogFlowtter.fromFile().then((instance) => _dialogFlowtter = instance);
    // ager file name dialog_flow_auth ki bjaye kuch aur ho tou fromAssets se access hoga
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '달챗',
      child: Column(
        children: [
          Expanded(
            child: MessagesScreen(messages: messages),
          ),
          Container(
            color: PRIMARY_COLOR,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 14,
              ),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  },
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        // print("men msg apka add krne lga hun vroo");
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      // print("abhi tk code chal rha hai");
      DetectIntentResponse response = await _dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));

      // print(response.message.toString() + "Yeh response msg hai");

      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _dialogFlowtter.dispose();
    super.dispose();
  }
}

// Send Message
// void sendMessage(String text) async {
//   if (text.isEmpty) {
//     debugPrint("kuch nhi likha vrooo tumne");
//     return;
//   } else {
//     // first setState for user
//     setState(() {
//       addMessage(Message(text: DialogText(text: [text])), true);
//     });

//     DetectIntentResponse response = await _dialogFlowtter.detectIntent(
//       queryInput: QueryInput(text: TextInput(text: text)),
//     );

//     if (response.message == null) {
//       debugPrint("RESPONSE HI NULL HAI BHAI - ISLIAY WAPIS CHALA GYA");
//       return;
//     }
//     setState(() {
//       // second setState for bot (after getting the response against the message)
//       addMessage(response.message!);
//     });
//   }
// }
