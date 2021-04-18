import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'vote_screen.dart';

class HomeSceen extends StatefulWidget {
  HomeSceen({Key key}) : super(key: key);

  @override
  _HomeSceen createState() => _HomeSceen();
}

class _HomeSceen extends State<HomeSceen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference _voteList =
        FirebaseFirestore.instance.collection('list');

    return Material(
        child: SafeArea(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            width: double.infinity,
            child: Container(
              child: Text(
                "Votely",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _voteList.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              return new ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return new GestureDetector(
                    child: new Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              document['title'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(document['description'])
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VoteScreen(idKey: document.id),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            },
          ),
        ),
      ]),
    ));
  }
}
