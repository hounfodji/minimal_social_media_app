import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/my_drawer.dart';
import 'package:minimal_social_media_app/components/my_list_tile.dart';
import 'package:minimal_social_media_app/components/my_post_button.dart';
import 'package:minimal_social_media_app/components/my_textfield.dart';
import 'package:minimal_social_media_app/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // acccess to firestore database
  final FirestoreDatabase database = FirestoreDatabase();

  // text controller
  final TextEditingController newPostController = TextEditingController();

  // post message
  void postMessage() {
    // only post message if there is something in the textfield
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }

    // clear the controller
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("W A L L"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          // text field for user to tap
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                // textfield
                Expanded(
                  child: MyTextField(
                      hintText: "Say something",
                      obscureText: false,
                      controller: newPostController),
                ),

                // post button
                MyPostButton(
                  onTap: postMessage,
                )
              ],
            ),
          ),

          // posts
          StreamBuilder(stream: database.getPostsStream(), builder: (context,snapshot) {
            // show loading circle
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // get all posts
            final posts = snapshot.data!.docs;
           


            // no data?
            if (snapshot.data == null || posts.isEmpty) {
               print(posts);
               print(snapshot.data!.docs);
              return const Center(
                child: Padding(padding: EdgeInsets.all(25), child: Text("No Post...Post something!"),),
              );
            }


            // return as a list
            return Expanded(child: ListView.builder(itemCount: posts.length, itemBuilder: (context, index) {
              // get individual posts
              final post = posts[index];

              // get data from each post
              String message = post["PostMessage"];
              String userEmail = post["UserEmail"];
              Timestamp timestamp = post["TimeStamp"];

              // return as a list tile
              return MyListTile(title: message, subtitle: userEmail); 

            },));
          })
        ],
      ),
    );
  }
}
