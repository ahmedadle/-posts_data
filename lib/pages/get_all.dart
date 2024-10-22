// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posts_data/pages/get_post.dart';
import 'package:posts_data/widget/edit_post.dart';

class GetAll extends StatefulWidget {
  const GetAll({super.key});

  @override
  State<GetAll> createState() => _GetAllState();
}

class _GetAllState extends State<GetAll> {
  List<dynamic> posts = [];
  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    var url = Uri.https('dummyjson.com', 'posts');
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    setState(() {
      posts = data['posts'];
    });
  }

  Future<void> _deletePost(int id) async {
    final url = Uri.parse('https://dummyjson.com/posts/$id');
    final response = await http.delete(url);
    setState(() {
      posts.removeWhere((post) => post['id'] == id);
    });
  }

  Future<void> _viewPost(int id) async {
    final data = posts.firstWhere((post) => post['id'] == id);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GetPost(
          title: data['title'],
          body: data['body'],
          tags: data['tags'],
          like_reactions: data['reactions']['likes'],
          dislike_reactions: data['reactions']['dislikes'],
          views: data['views']);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get All'),
      ),
      body: posts.isEmpty
          ? _Loder()
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post['title']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deletePost(post['id']);
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EditPost(
                              id: post['id'],
                              initialTitel: post['title'],
                              initialbody: post['body'],
                            );
                          }));
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        icon: const Icon(Icons.view_compact_alt),
                        onPressed: () {
                          _viewPost( post['id']);
                        },
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}

Widget _Loder() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
