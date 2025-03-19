import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AIChatScreen extends StatefulWidget {
  @override
  _AIChatScreenState createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  void _sendMessage() async {
    String userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({"role": "user", "content": userMessage});
      _isLoading = true;
    });

    _controller.clear();

    // Simulate AI response delay
    await Future.delayed(Duration(seconds: 1));

    String aiMessage = _getAIResponse(userMessage);

    setState(() {
      _messages.add({"role": "assistant", "content": aiMessage});
      _isLoading = false;
    });
  }

  String _getAIResponse(String userMessage) {
    userMessage = userMessage.toLowerCase();

    if (userMessage.contains("disease")) {
      return "Common plant diseases include leaf rust, powdery mildew, and blight. Use neem oil or fungicides for treatment.";
    } else if (userMessage.contains("fertilizer")) {
      return "For healthy plants, use organic fertilizers like compost or manure. Chemical fertilizers like NPK are also effective.";
    } else if (userMessage.contains("weather")) {
      return "Check the weather forecast in your area. Plants need more water during hot, dry weather.";
    } else if (userMessage.contains("hello") || userMessage.contains("hi")) {
      return "Hello! How can I assist you today?";
    } else {
      return "I'm here to help with plant care! Ask me about diseases, fertilizers, or weather.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Chatbot', style: TextStyle(fontFamily: 'Poppins')),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: EdgeInsets.all(16),
              child: SpinKitThreeBounce(color: Colors.green, size: 20),
            ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, String> message) {
    bool isUser = message["role"] == "user";
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isUser ? Colors.green.shade100 : Colors.green.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message["content"]!,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.send, color: Colors.green),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}