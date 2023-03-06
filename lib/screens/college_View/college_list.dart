import 'package:assign_1/screens/package_resources/package_resources.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class CollegeList extends StatefulWidget {
  String? textSearchCtrl;
  static String id = "College list";
  @override
  State<CollegeList> createState() => _CollegeListState();
  CollegeList({this.textSearchCtrl});
}

class _CollegeListState extends State<CollegeList> {
  List<CollegeDataModel> collegeData = [];

  Future<http.Response?>? apiCall() async {
    var data;
    var response = await http.get(Uri.parse(
        "http://universities.hipolabs.com/search?country=${widget.textSearchCtrl}"));
    setState(() {
      try {
        data = List<CollegeDataModel>.from(json
            .decode(response.body)
            .map((data) => CollegeDataModel.fromJson(data)));
      } catch (e) {
        print("no data");
      }
      collegeData.addAll(data);
      print(collegeData.length);
    });
  }

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("College List"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: collegeData.length == 0
            ? Center(child: CircularProgressIndicator(),)
            : ListView.builder(
                itemCount: collegeData.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text("Name: ${collegeData[index].name}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text("Country: ${collegeData[index].country}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                              "Domain : ${collegeData[index].domains?.first}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: () {
                                var toLaunch = Uri.parse(
                                    collegeData[index].webPages!.first);
                                _launchInWebViewOrVC(toLaunch);
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: 'Url: ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${collegeData[index].webPages?.first}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue)),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}
