import 'package:flutter/material.dart';
import 'package:contacttracingprototype/screens/your_status_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:contacttracingprototype/utilities/constants.dart';
import 'package:contacttracingprototype/screens/self_assesment.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:contacttracingprototype/components/common_bottom_sheet.dart';
import 'faq_screen.dart';
import 'package:contacttracingprototype/screens/nearby_interface.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CommonScreen extends StatefulWidget {
  Color color;
  static const String id = 'Home';
  @override
  _CommonScreenState createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {

  InAppWebViewController _webViewController;
  String url = "";
  double progress = 0;
  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF4082FF),
          title: Text(
            'Covid Watch',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info_outline, color: Colors.white),
              iconSize: 25.0,
              color: Color(0xFF232b2b),
              onPressed: () {
                Alert(
                  context: context,
                  title: "Covid Watch®",
                  desc: "Copyright© 2020 ",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                ).show();
              },
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Color(0xFF76C4FE),
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                icon: FaIcon(
                  FontAwesomeIcons.heartbeat,
                ),
                text: 'Your Status',
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.stethoscope),
                text: 'Self Assess',
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.chartBar),
                text: 'COVID Update',
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.searchLocation),
                text: 'NearBy',
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.questionCircle),
                text: 'FAQ',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            YourStatusListView(),
            SelfAssesment(),
            webViewUpdate(),
            NearbyInterface(),
            FAQ(),
          ],
        ),
        bottomSheet: CommonBottomSheet(),
      ),
    );
  }

  Container webViewUpdate() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : Container(),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: InAppWebView(
                initialUrl: "https://dashboard.kerala.gov.in/",
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                  debuggingEnabled: true,
                )),
                onWebViewCreated: (InAppWebViewController controller) {
                  _webViewController = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {
                  setState(() {
                    this.url = url;
                  });
                },
                onLoadStop:
                    (InAppWebViewController controller, String url) async {
                  setState(() {
                    this.url = url;
                  });
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
