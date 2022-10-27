import 'package:app_travel/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../shared/shared.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: src(),
    );
  }
}

class src extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _srcState();
  }
}

List<liburan> liburans = [
  liburan(
      img: "assets/image/Mountain 2.jpg",
      judul: 'Everest'),
  liburan(
      img: "assets/image/Mountain 1.jpg",
      judul: 'Waterfall')
];

class _srcState extends State<src> {
  TextEditingController searchController = new TextEditingController();
  String filter = "";

  @override
  initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
                        hintText: "Search",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                new Expanded(
                  child: new ListView.builder(
                    itemCount: liburans.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: color1,
                        child: ListTile(
                          title: Text(
                            '${liburans[index].judul}',
                          ),
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 44,
                              minHeight: 44,
                              maxWidth: 64,
                              maxHeight: 64,
                            ),
                            child: Image.asset('${liburans[index].img}',fit: BoxFit.fill,),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ))));
  }
}

class liburan {
  final String img;
  final String judul;

  const liburan(
      {required this.img, required this.judul});
}
