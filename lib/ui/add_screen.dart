import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
              child: Column(children: [
            TextFormField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Title',
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0)),
              ),
              style: TextStyle(color: Colors.black, fontSize: 17),
              //  controller: _titleController,
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              maxLength: 1000,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Description',
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0)),
              ),
              style: TextStyle(color: Colors.black, fontSize: 17),
              //  controller: _titleController,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Choice 1',
                      labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: new UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0)),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    //  controller: _titleController,
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Choice 2',
                      labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: new UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0)),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    //  controller: _titleController,
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
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Choice 3',
                      labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: new UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0)),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    //  controller: _titleController,
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Choice 4',
                      labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: new UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0)),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    //  controller: _titleController,
                  ),
                )),
              ],
            ),
            RaisedButton(
              color: Colors.black,
              onPressed: () {},
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
