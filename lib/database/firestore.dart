/*

  This database stores posts that user publish in the app.
  It is stored in a collection called "Posts" in firebase

  Each post contains:
    - a message
    - email of user
    - timestamp

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  // current logged in user
  User? user = FirebaseAuth.instance.currentUser;

  // get collection of posts from fiebase
  final CollectionReference posts = FirebaseFirestore.instance.collection("Posts");

  // post a message
  Future<void> addPost(String message) {
    return posts.add({
      'userEmail': user!.email,
      'postMessage' : message,
      'TimeStamp' : Timestamp.now()
    });
  }

  // read posts from database
  Stream<QuerySnapshot> getPostsStream() {
    final postsStream = FirebaseFirestore.instance
      .collection("Posts")
      .orderBy("Timestamp", descending: true)
      .snapshots();

      return postsStream;
  }
  
}