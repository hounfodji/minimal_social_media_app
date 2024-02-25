import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/my_back_button.dart';
import 'package:minimal_social_media_app/components/my_list_tile.dart';
import 'package:minimal_social_media_app/helper/helper_functions.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: ((context, snapshot) {
            // any error
            if (snapshot.hasError) {
              displayMessageToUser("Something went wrong", context);
            }
            // slow loading circle
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData == null) {
              return Text("No Data");
            }

            // get all users
            final users = snapshot.data!.docs;

            return Column(
              children: [
                // back button
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 25.0),
                  child: Row(
                    children: [
                      MyBackButton(),
                    ],
                  ),
                ),

                // list of users in the app
                Expanded(
                  child: ListView.builder(
                      itemCount: users.length,
                      padding: EdgeInsets.all(0.0),
                      itemBuilder: ((context, index) {
                        // get individual user
                        final user = users[index];

                        // get data from each user
                        String username = user["username"];
                        String userEmail = user["email"];

                        return MyListTile(
                          title: username,
                          subtitle: userEmail,
                        );
                      })),
                ),
              ],
            );

            // get all users
          })),
    );
  }
}
