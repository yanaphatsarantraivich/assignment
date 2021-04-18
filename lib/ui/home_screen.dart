import 'package:flutter/material.dart';

class HomeSceen extends StatefulWidget {
  HomeSceen({Key key}) : super(key: key);

  @override
  _HomeSceen createState() => _HomeSceen();
}

class _HomeSceen extends State<HomeSceen> {
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
        Expanded(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Test ${index + 1}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book")
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ]),
    ));
  }
}
