import 'package:flutter/material.dart';
import 'package:contacttracingprototype/components/covid_tips.dart';
import 'package:contacttracingprototype/components/social_tips.dart';
import 'package:contacttracingprototype/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:contacttracingprototype/components/modal_bottomsheet_style.dart';

class YourStatusListView extends StatefulWidget {
  @override
  _YourStatusListViewState createState() => _YourStatusListViewState();
}

class _YourStatusListViewState extends State<YourStatusListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  double lattitude;
  double longittude;
  String _currentAddress = 'Current location';

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lattitude = position.latitude;
      longittude = position.longitude;
      final coordinates = new Coordinates(lattitude, longittude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      setState(() {
        _currentAddress = first.featureName.toString();
      });
    } catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Color(0xFF26ABFF),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          child: Center(
                            // child: Text(
                            //   '👩🏻‍',
                            //   style: TextStyle(fontSize: 30.0),
                            // ),
                            child: Image.asset(
                              'images/location.jpg',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          decoration: kInnerDecoration,
                        ),
                      ),
                      height: 80.0,
                      width: 80.0,
                      decoration: kGradientBoxDecoration,
                    ),
                  ],
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Text(
                      'You are at \n $_currentAddress',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text('We Recommends:', style: kHeadingStyle),
        ),
        SizedBox(
          height: 20.0,
        ),
        CovidTips(
          image: 'images/img1.jpg',
          title: 'Maintain Social Distance',
        ),
        CovidTips(
          image: 'images/img2.jpg',
          title: 'Take Self Asssesment Test',
        ),
        CovidTips(
          image: 'images/img3.jpg',
          title: 'Check App Regulerly for Updates',
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text('How to maintain social distance:', style: kHeadingStyle),
        ),
        SizedBox(
          height: 10.0,
        ),
        SocialTips(
          title: 'Say Hi without HandShakes',
          image: 'images/img4.jpg',
        ),
        CovidTips(
          image: 'images/img5.jpg',
          title: 'Avoid Social Gatherings',
        ),
        SocialTips(
          title: 'Keep Distance atleast 6ft',
          image: 'images/img6.jpg',
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text('How to stay safe:', style: kHeadingStyle),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  child: Image.asset(
                    'images/img7.jpg',
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleChildScrollView(
                        child:  ModalBottomSheetStyle(),
                      ),
                    );
                  },
                ),
                Text('COVID-19 Do\'s & Don\'ts', style: kHeadingStyle),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  child: Image.asset('images/img7.jpg'),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleChildScrollView(
                        child:  ModalBottomSheetStyle(),
                      ),
                    );
                  },
                ),
                Text('Learn more about COVID-19', style: kHeadingStyle),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  child: Image.asset('images/img8.jpg'),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleChildScrollView(
                        child: ModalBottomSheetStyle(),
                      ),
                    );
                  },
                ),
                Text('Safe measeure against COVID-19', style: kHeadingStyle),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 100.0,
        ),
      ],
    );
  }
}

