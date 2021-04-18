import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'vote_choice.dart';

class VoteScreen extends StatefulWidget {
  String idKey;

  VoteScreen({@required this.idKey});

  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  CollectionReference vote = FirebaseFirestore.instance.collection('list');

  String selectedChoice = 'NA';

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('vote')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .where('voteId', isEqualTo: widget.idKey)
        .get()
        .then(
          (QuerySnapshot snapshot) => {
            snapshot.docs.forEach((f) {
              //selectedChoice = f['selected'].toString();
            }),
          },
        );

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
        FutureBuilder<DocumentSnapshot>(
          future: vote.doc(widget.idKey).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data.data();
              return Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 30.0, left: 20),
                    child: Text(
                      data['title'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 20.0, right: 20.0),
                    child: Text(
                      '        ' + data['description'],
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 50),
                  //VoteChoice(choiceText: data['choice_a'], choiceValue: 'A'),
                  InkWell(
                    onTap: () {
                      addVote(widget.idKey, 'A');
                      setState(() => selectedChoice = 'A');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 350,
                      child: Text(
                        data['choice_a'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: selectedChoice == 'A'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color:
                            selectedChoice == 'A' ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      addVote(widget.idKey, 'B');
                      setState(() => selectedChoice = 'B');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 350,
                      child: Text(
                        data['choice_b'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: selectedChoice == 'B'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color:
                            selectedChoice == 'B' ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      addVote(widget.idKey, 'C');
                      setState(() => selectedChoice = 'C');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 350,
                      child: Text(
                        data['choice_c'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: selectedChoice == 'C'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color:
                            selectedChoice == 'C' ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      addVote(widget.idKey, 'D');
                      setState(() => selectedChoice = 'D');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 350,
                      child: Text(
                        data['choice_d'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: selectedChoice == 'D'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color:
                            selectedChoice == 'D' ? Colors.black : Colors.white,
                      ),
                    ),
                  )
                ],
              );
            }
            return Text("loading");
          },
        ),
      ]),
    ));
  }
}

Future addVote(String voteId, String selectedChoice) async {
  try {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('vote')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .where('voteId', isEqualTo: voteId)
        .get();

    final List<DocumentSnapshot> documents = result.docs;

    if (documents.length == 0) {
      FirebaseFirestore.instance.collection('vote').add({
        'userId': FirebaseAuth.instance.currentUser.uid,
        'voteId': voteId,
        'selected': selectedChoice,
      });
      print('ADD SUCCESS');
    } else {
      FirebaseFirestore.instance
          .collection('vote')
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .where('voteId', isEqualTo: voteId)
          .get()
          .then(
            (QuerySnapshot snapshot) => {
              snapshot.docs.forEach((f) {
                FirebaseFirestore.instance
                    .collection('vote')
                    .doc(f.id)
                    .update({'selected': selectedChoice});
              }),
            },
          );
      print('UPDATE SUCCESS');
    }
  } catch (e) {
    return false;
  }
}
