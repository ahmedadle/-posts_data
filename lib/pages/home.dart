import 'package:flutter/material.dart';
import 'package:posts_data/pages/get_all.dart';
import 'package:posts_data/widget/add_post.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 186, 213),
      appBar: AppBar(
        title: const Text('home page'),
      ),
      body:Center(
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GetAll();
                  }));
                },
                child: const Text(
                  'Get all posts',
                  style: TextStyle(fontSize: 30,color: Colors.white)
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,

                borderRadius: BorderRadius.circular(15),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddPost();
                  }));
                },
                child: const Text(
                  'Add post',
                  style: TextStyle(fontSize: 30,color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
