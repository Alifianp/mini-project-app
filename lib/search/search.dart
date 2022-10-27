import 'package:app_travel/shared/shared.dart';
import 'package:flutter/material.dart';

import '../shared/shared.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: color1,
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 35, left: 8, right: 8, bottom: 8),
                child: TextField(
                  onChanged: (value) {},
                  controller: editingController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 216, 216, 216),
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
