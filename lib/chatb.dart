import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';


class ChatMessage {
  final String content;
  final bool isAudio;
  final bool isFromBot;
  ChatMessage(this.content, {this.isAudio = false, this.isFromBot = false});
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  FlutterSoundRecorder? _recorder;
  FlutterSoundPlayer? _player;
  bool _isRecording = false;
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _init();
    _messages.add(ChatMessage(
      "Fale 🎤 /digite 🤳 ou clique 👆:\n1. Para saber sobre Combinação de estratégias de adaptação e mitigação;\n2. Para saber sobre como Estimular a adoção e manutenção de Sistemas, Práticas, Produtos e Processos de Produção Sustentáveis ABC+;\n3. Para visita de técnico para sua produção\n4.Para receber visita de técnico sobre empreendedorismo\n5.Para receber visita de técnico sobre empreendedorismo",
      isFromBot: true,
    ));
  }

  Future<void> _init() async {
    _recorder = FlutterSoundRecorder();
    _player = FlutterSoundPlayer();
    await _recorder?.openRecorder();
    await _player?.openPlayer();
    await Permission.microphone.request();
  }

  @override
  void dispose() {
    _player?.closePlayer();
    _recorder?.closeRecorder();
    _recorder = null;
    _player = null;
    super.dispose();
  }

  Future<void> _record() async {
    String path = '/storage/emulated/0/flutter_sound_example_${DateTime.now().millisecondsSinceEpoch}.aac';
    if (_isRecording) {
      await _recorder?.stopRecorder();
      _addMessage(ChatMessage(path, isAudio: true));
    } else {
      await _recorder?.startRecorder(
        toFile: path,
        codec: Codec.aacADTS,
      );
    }
    setState(() {
      _isRecording = !_isRecording;
    });
  }

  Future<void> _play(String path) async {
    await _player?.startPlayer(
      fromURI: path,
      codec: Codec.aacADTS,
      whenFinished: () {},
    );
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      _addMessage(ChatMessage(text));
      _scrollToBottom();
    }
  }

  void _addMessage(ChatMessage message) {
    setState(() {
      _messages.add(message);
    });
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acesso a informação'),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: _buildChatBubble(_messages[index], index),
                );
              },
            ),
          ),
          _isRecording
              ? LinearProgressIndicator(
            minHeight: 5,
            color: Colors.red,
          )
              : SizedBox.shrink(),
          MessageInputField(
            controller: _messageController,
            isRecording: _isRecording,
            onSend: () {
              _sendMessage(_messageController.text);
              _messageController.clear();
            },
            onRecord: _record,
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(ChatMessage message, int index) {
    return Row(
      mainAxisAlignment: message.isFromBot ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (message.isFromBot)
          CircleAvatar(
            child: Icon(Icons.android_outlined),
          ),
        Flexible(
          child: Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: message.isFromBot ? Colors.grey[300] : Colors.blue[300],
            ),
            child: Column(
              children: [
                message.isAudio
                    ? IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () => _play(message.content),
                )
                    : Text(
                  message.content,
                  textAlign: TextAlign.justify,
                ),
                if (message.isFromBot && index == 0)
                  ..._buildOptionButtons(),
              ],
            ),
          ),
        ),
        if (!message.isFromBot)
          CircleAvatar(
            child: Icon(Icons.person_outline),
          ),
      ],
    );
  }

  List<Widget> _buildOptionButtons() {
    return [
      Wrap(
        spacing: 10,
        runSpacing: 5,
        children: List.generate(5, (index) {
          return ElevatedButton(
            onPressed: () => _sendMessage('Opção ${index + 1}'),
            child: Text('Opção ${index + 1}'),
          );
        }),
      ),
    ];
  }
}

class MessageInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isRecording;
  final VoidCallback onSend;
  final VoidCallback onRecord;

  MessageInputField({
    required this.controller,
    required this.isRecording,
    required this.onSend,
    required this.onRecord,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(isRecording ? Icons.stop : Icons.mic),
            onPressed: onRecord,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Digite uma mensagem',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: onSend,
          ),
        ],
      ),
    );
  }
}

