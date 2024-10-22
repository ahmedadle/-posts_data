// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPost extends StatefulWidget {
  

  AddPost({super.key,});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController _titelController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  Future<void> _addPost() async {
    final String title = _titelController.text;
    final String body = _bodyController.text;
    const int userId = 1;
    final url = Uri.parse('https://dummyjson.com/posts/add');
    
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'titel': title, 'body': body, 'userId': userId}));

    
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Post added successfully!")));
        _titelController.clear();
        _bodyController.clear();
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.8),
        child: Column(
          children: [
            TextField(
              controller: _titelController,
              decoration: InputDecoration(labelText: 'titel'),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'body'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              
              child: TextButton(onPressed: _addPost, child: Text('Add Post',style: TextStyle(color: Colors.white,))))
          ],
        ),
      ),
    );
  }
}
