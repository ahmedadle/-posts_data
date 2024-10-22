import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  final String initialTitel;
  final String initialbody;
  final int id;

  const EditPost(
      {super.key,
      required this.id,
      required this.initialTitel,
      required this.initialbody});

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  late TextEditingController _titelController;
  late TextEditingController _bodyController;
  @override
  void initState() {
    super.initState();
    _titelController = TextEditingController(text: widget.initialTitel);
    _bodyController = TextEditingController(text: widget.initialbody);
  }

  Future<void> _UpdatPosts() async {
    Uri.parse ('https://dummyjson.com/posts/${widget.id}');
    Navigator.pop(context,
        {'title': _titelController.text, 
        'body': _bodyController.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Post'),),
      body: Padding(padding: EdgeInsets.all(0.8)
      ,
      child: Column(
        children: [
          TextField(
            controller: _titelController,
            decoration: InputDecoration(labelText: 'Titel'),
          )
          ,TextField(
            controller: _bodyController,
            decoration: InputDecoration(labelText: 'body'),
          )
          ,SizedBox(height: 20,)
          ,TextButton(onPressed: _UpdatPosts, child: Text('UpdatePost',style: TextStyle(fontSize: 20),))
        ],
      ),
      ),
    );
  }
}
