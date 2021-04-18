import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'vote_state.dart';

class VoteChoice extends StatelessWidget {
  String choiceText;
  String choiceValue;

  VoteChoice({@required this.choiceText, this.choiceValue});

  Widget build(BuildContext context) {
    return Consumer<VoteState>(
        builder: (context, voteStates, _) => InkWell(
              onTap: () {
                voteStates.setBackGroundColor(
                    new RadioListValue(0, Colors.black, "Black"));
                voteStates
                    .setFontColor(new RadioListValue(1, Colors.white, "White"));
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 350,
                child: Text(
                  choiceText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: voteStates.fontColor.color,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: voteStates.backGroundColor.color,
                ),
              ),
            ));
  }
}

// Future addVote(String voteId, String selectedChoice) async {
//   try {
//     final QuerySnapshot result = await FirebaseFirestore.instance
//         .collection('vote')
//         .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
//         .where('voteId', isEqualTo: voteId)
//         .get();

//     final List<DocumentSnapshot> documents = result.docs;

//     if (documents.length == 0) {
//       FirebaseFirestore.instance.collection('vote').add({
//         'userId': FirebaseAuth.instance.currentUser.uid,
//         'voteId': voteId,
//         'selected': selectedChoice,
//       });
//       print('ADD SUCCESS');
//     } else {
//       FirebaseFirestore.instance
//           .collection('vote')
//           .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
//           .where('voteId', isEqualTo: voteId)
//           .get()
//           .then(
//             (QuerySnapshot snapshot) => {
//               snapshot.docs.forEach((f) {
//                 FirebaseFirestore.instance
//                     .collection('vote')
//                     .doc(f.id)
//                     .update({'selected': selectedChoice});
//               }),
//             },
//           );
//       print('UPDATE SUCCESS');
//     }
//   } catch (e) {
//     return false;
//   }
// }
