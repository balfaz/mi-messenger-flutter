import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mimessenger/widget/chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _staEscribiendo = false;
  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            children: [
              CircleAvatar(
                child: Text(
                  'Test',
                  style: TextStyle(fontSize: 12),
                ),
                backgroundColor: Colors.blue[100],
              ),
              SizedBox(
                height: 3.0,
              ),
              Text(
                'Carlos Balarezo',
                style: TextStyle(color: Colors.black87, fontSize: 12),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 1,
        ),
        body: Container(
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
              )),
              Divider(
                height: 1,
              ),
              Container(
                color: Colors.white,
                height: 100.0,
                child: _inputChat(),
              )
            ],
          ),
        ));
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: [
        Flexible(
          child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmit,
            onChanged: (String texto) {
              setState(() {
                if (texto.trim().length > 0) {
                  _staEscribiendo = true;
                } else {
                  _staEscribiendo = false;
                }
              });
            },
            decoration: InputDecoration.collapsed(hintText: 'Envia mensaje'),
            focusNode: _focusNode,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          child: Platform.isIOS
              ? CupertinoButton(
                  child: Text('Enviar'),
                  onPressed: _staEscribiendo
                      ? () => _handleSubmit(_textController.text.trim())
                      : null,
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconTheme(
                    data: IconThemeData(color: Colors.blue[400]),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: Icon(Icons.send),
                      onPressed: _staEscribiendo
                          ? () => _handleSubmit(_textController.text.trim())
                          : null,
                    ),
                  ),
                ),
        )
      ]),
    ));
  }

  _handleSubmit(String texto) {
    if (texto.length == 0) return;
    _focusNode.requestFocus();
    _textController.clear();
    final newMessage = ChatMessage(
      uid: '123',
      texto: texto,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 400)),
    );
    _messages.insert(
      0,
      newMessage,
    );
    newMessage.animationController.forward();
    setState(() {
      _staEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // off socket
    for (ChatMessage message in _message) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
