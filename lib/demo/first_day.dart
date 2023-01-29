import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test_jay_post/demo/next_page.dart';
import 'package:test_jay_post/provider.dart';

class DemoFirst extends StatefulWidget {
  DemoFirst({key});

  @override
  State<DemoFirst> createState() => _DemoFirstState();
}

class _DemoFirstState extends State<DemoFirst> {
  bool loading = false;
  String? inputname;
  String? inputjob;

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   loading = true;
    // });
    // Provider.of<CustomProvider>(context, listen: false).getDemo().then((value) {
    //   setState(() {
    //     loading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<CustomProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text("Jay demo")),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Container(
                      height: 600,
                      child: ListView(
                        children: [
                          const SizedBox(height: 20),
                          TextField(
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                              onChanged: (value) {
                                inputname = value;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Write name",
                                fillColor: Colors.transparent,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                              )),
                          const SizedBox(height: 20),
                          TextField(
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                              onChanged: (value) {
                                inputjob = value;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Write Job",
                                fillColor: Colors.transparent,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                              )),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  loading = true;
                                });
                                bool value = await item.submitForm(
                                    job: inputjob, name: inputname);
                                setState(() {
                                  loading = false;
                                });
                                if (value == true) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return NextPage();
                                    },
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Something went wrong")));
                                }
                              },
                              child: const Text("Submit"))
                        ],
                      ))),
            ),
    );
  }
}
