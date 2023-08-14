import 'package:deliciousdal/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:deliciousdal/screen/local_dto/chat_dto.dart';

class TextScreen extends StatelessWidget {
  const TextScreen(
      {Key? key,
      required this.myName,
      required this.list,
      required this.client})
      : super(key: key);
  final String myName;
  final List<ChatDto> list;
  final SupabaseClient client;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        reverse: true,
        itemBuilder: (context, index) => _oneItem(list[index]));
  }

  Widget _oneItem(ChatDto dto) {
    var me = myName == dto.name;
    return Align(
      alignment: me ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: me
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            color: me ? SECOND_COLOR : PRIMARY_COLOR),
        child: Text(
          dto.text,
          style: TextStyle(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
