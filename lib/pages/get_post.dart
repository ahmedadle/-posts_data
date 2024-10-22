import 'package:flutter/material.dart';

class GetPost extends StatelessWidget {
  final String title, body;
  final List<dynamic> tags;
  final int like_reactions, dislike_reactions, views;
 const GetPost({
    super.key,
    required this.title,
    required this.body,
    required this.tags,
    required this.like_reactions,
    required this.dislike_reactions,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('view post'),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 10),
              Text(body),
              SizedBox(height: 10),
              Text('tags: ${tags.join(', ')}'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(like_reactions.toString()),
                  Icon(Icons.thumb_up),
                  SizedBox(width: 10),
                  Text(dislike_reactions.toString()),
                  Icon(Icons.thumb_down),
                  SizedBox(width: 10),
                  Text(views.toString()),
                  Icon(Icons.visibility),
                ],
              )
            
            ],
          ),
          
          ),
        ),
      ),
      
    );
  }
}
