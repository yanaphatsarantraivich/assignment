import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _choiceAController = TextEditingController();
  final TextEditingController _choiceBController = TextEditingController();
  final TextEditingController _choiceCController = TextEditingController();
  final TextEditingController _choiceDController = TextEditingController();

  String _errorTitle,
      _errorDescription,
      _errorChoiceA,
      _errorChoiceB,
      _errorChoiceC,
      _errorChoiceD;

  @override
  Widget build(BuildContext context) {
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
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: _titleController,
                  onTap: () {
                    setState(() => _errorTitle = null);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      setState(() => _errorTitle = 'Please enter title');
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    errorText: _errorTitle,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                    ),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                TextFormField(
                  controller: _descriptionController,
                  onTap: () {
                    setState(() => _errorDescription = null);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      setState(
                          () => _errorDescription = 'Please enter description');
                    }
                    return null;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  maxLength: 1000,
                  decoration: InputDecoration(
                    errorText: _errorDescription,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                    ),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _choiceAController,
                        onTap: () {
                          setState(() => _errorChoiceA = null);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            setState(
                                () => _errorChoiceA = 'Please enter choice A');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorText: _errorChoiceA,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Choice A',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                          ),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _choiceBController,
                        onTap: () {
                          setState(() => _errorChoiceB = null);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            setState(
                                () => _errorChoiceB = 'Please enter choice B');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorText: _errorChoiceB,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Choice B',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                          ),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _choiceCController,
                        onTap: () {
                          setState(() => _errorChoiceC = null);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            setState(
                                () => _errorChoiceC = 'Please enter choice C');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorText: _errorChoiceC,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Choice C',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                          ),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _choiceDController,
                        onTap: () {
                          setState(() => _errorChoiceD = null);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            setState(
                                () => _errorChoiceD = 'Please enter choice D');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorText: _errorChoiceD,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Choice D',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                          ),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    )),
                  ],
                ),
                MaterialButton(
                  color: Colors.black,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      String status = await addVote(
                          _titleController.text,
                          _descriptionController.text,
                          _choiceAController.text,
                          _choiceBController.text,
                          _choiceCController.text,
                          _choiceDController.text);
                      if (status == 'success') {
                        print('true');
                      } else {
                        print('false');
                      }
                    } else {
                      return;
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ])),
        )
      ]),
    ));
  }
}

Future addVote(String title, String description, String choice_a,
    String choice_b, String choice_c, String choice_d) async {
  try {
    FirebaseFirestore.instance.collection('list').add({
      'title': title,
      'description': description,
      'choice_a': choice_a,
      'choice_b': choice_b,
      'choice_c': choice_c,
      'choice_d': choice_d,
      'userId': FirebaseAuth.instance.currentUser.uid,
    });
    return 'success';
  } catch (e) {
    return false;
  }
}
