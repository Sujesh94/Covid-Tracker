import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:contacttracingprototype/screens/home_page.dart';
import 'package:contacttracingprototype/service/message_service.dart';
import 'package:contacttracingprototype/service/service_locator.dart';
import 'package:contacttracingprototype/utilities/constants.dart';

enum UserDecision { yes, no }

class SelfAssesment extends StatefulWidget {
  @override
  _SelfAssesmentState createState() => _SelfAssesmentState();
}

class _SelfAssesmentState extends State<SelfAssesment> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  bool isChecked = false,
      isChecked1 = false,
      isChecked2 = false,
      isChecked3 = false,
      isChecked4 = false,
      isChecked5 = false;
  bool isChecked7 = false,
      isChecked8 = false,
      isChecked9 = false,
      isChecked10 = false,
      isChecked6 = false;
  UserDecision _decision = UserDecision.yes;

  final String number = '8943330115';
  void assessmentResult() {
    if (isChecked || isChecked1 || isChecked2 || isChecked8 || isChecked9) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "You are under risk",
        desc: "Please contact nearest health authorities",
        buttons: [
          DialogButton(
            color: Colors.red,
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            //onPressed: () => Navigator.pop(context),
            onPressed: () {
              _service.sendSms(number);
              // _service.call(number);
              //Navigator.pushNamed(context, CommonScreen.id);
            },
            width: 120,
          )
        ],
      ).show();
    } else if (isChecked4 || isChecked5 || isChecked6) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "You have higher chance to get COVID-19",
        desc: "Please Stay Home",
        buttons: [
          DialogButton(
            color: Colors.orange,
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pushNamed(context, CommonScreen.id),
            width: 120,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.success,
        title: "You are safe",
        desc: "Stay Home,Stay Safe",
        buttons: [
          DialogButton(
            color: Colors.green,
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pushNamed(context, CommonScreen.id),
            width: 120,
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                Text(
                  kAssessmentQuestion1,
                  style: kAssessmentTextStyle,
                ),
                ListTile(
                  title: Text('Cough'),
                  leading: Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(
                        () {
                          isChecked = value;
                          isChecked3 = false;
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('Fever'),
                  leading: Checkbox(
                    value: isChecked1,
                    onChanged: (value) {
                      setState(
                        () {
                          isChecked1 = value;
                          isChecked3 = false;
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('Difficulty in Breathing'),
                  leading: Checkbox(
                    value: isChecked2,
                    onChanged: (value) {
                      setState(
                        () {
                          isChecked2 = value;
                          isChecked3 = false;
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('None of the Above'),
                  leading: Checkbox(
                    value: isChecked3,
                    onChanged: (value) {
                      setState(
                        () {
                          isChecked3 = value;
                          isChecked = isChecked1 = isChecked2 = false;
                        },
                      );
                    },
                  ),
                ),
                Text(
                 kAssessmentQuestion2,
                  style:kAssessmentTextStyle,
                ),
                ListTile(
                  title: Text('Diabetes'),
                  leading: Checkbox(
                    value: isChecked4,
                    onChanged: (value) {
                      setState(
                        () {
                          isChecked4 = value;
                          isChecked7 = false;
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('Lung disease'),
                  leading: Checkbox(
                    value: isChecked5,
                    onChanged: (value) {
                      setState(
                        () {
                          isChecked5 = value;
                          isChecked7 = false;
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('Heart disease'),
                  leading: Checkbox(
                    value: isChecked6,
                    onChanged: (value) {
                      setState(
                        () {
                          isChecked6 = value;
                          isChecked7 = false;
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('None of the Above'),
                  leading: Checkbox(
                    value: isChecked7,
                    onChanged: (value) {
                      setState(
                        () {
                          isChecked7 = value;
                          isChecked4 = isChecked5 = isChecked6 = false;
                        },
                      );
                    },
                  ),
                ),
                Text(
                 kAssessmentQuestion3,
                  style: kAssessmentTextStyle,
                ),
                ListTile(
                  title: Text('Yes'),
                  leading: Radio(
                    value: UserDecision.yes,
                    groupValue: _decision,
                    onChanged: (UserDecision value) {
                      setState(
                        () {
                          _decision = value;
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('No'),
                  leading: Radio(
                    value: UserDecision.no,
                    groupValue: _decision,
                    onChanged: (UserDecision value) {
                      setState(
                        () {
                          _decision = value;
                        },
                      );
                    },
                  ),
                ),
                Text(
                 kAssessmentQuestion4,
                  style: kAssessmentTextStyle,
                ),
                ListTile(
                  title: Text(
                     kAssessmentQuestion5),
                  leading: Checkbox(
                    value: isChecked8,
                    onChanged: (value) {
                      setState(
                        () {
                          isChecked8 = value;
                          isChecked10 = false;
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                      kAssessmentQuestion6),
                  leading: Checkbox(
                    value: isChecked9,
                    onChanged: (value) {
                      setState(
                        () {
                          isChecked9 = value;
                          isChecked10 = false;
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('None of the Above'),
                  leading: Checkbox(
                    value: isChecked10,
                    onChanged: (value) {
                      setState(
                        () {
                          isChecked10 = value;
                          isChecked8 = isChecked9 = false;
                        },
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  height: 75,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        color: Color(0xFF4082FF),
                        onPressed: () {
                          assessmentResult();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
