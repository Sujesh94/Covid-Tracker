import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:geocoder/geocoder.dart';

import '../components/contact_card.dart';
import '../utilities/constants.dart';

class NearbyInterface extends StatefulWidget {
  static const String id = 'nearby_interface';

  @override
  _NearbyInterfaceState createState() => _NearbyInterfaceState();
}

class _NearbyInterfaceState extends State<NearbyInterface> {
 Location location = Location();
  Firestore _firestore = Firestore.instance;
  final Strategy strategy = Strategy.P2P_STAR;
  FirebaseUser loggedInUser;
  String testText = '';
  final _auth = FirebaseAuth.instance;
  List<dynamic> contactTraces = [];
  List<dynamic> contactTimes = [];
  List<dynamic> contactLocations = [];

  void addContactsToList() async {
    await getCurrentUser();

    _firestore
        .collection('users')
        .document(loggedInUser.email)
        .collection('met_with')
        .snapshots()
        .listen((snapshot) {
      for (var doc in snapshot.documents) {
        String currUsername = doc.data['username'];
        DateTime currTime = doc.data.containsKey('contact time')
            ? (doc.data['contact time'] as Timestamp).toDate()
            : null;
        String currLocation = doc.data.containsKey('contact location')
            ? doc.data['contact location']
            : null;
        if (!contactTraces.contains(currUsername)) {
          contactTraces.add(currUsername);
          contactTimes.add(currTime);
          contactLocations.add(currLocation);
        }
      }
      //setState(() {});
      print(loggedInUser.email);
    });
  }

  void deleteOldContacts(int threshold) async {
    await getCurrentUser();
    DateTime timeNow = DateTime.now(); //get today's time

    _firestore
        .collection('users')
        .document(loggedInUser.email)
        .collection('met_with')
        .snapshots()
        .listen((snapshot) {
      for (var doc in snapshot.documents) {
//        print(doc.data.containsKey('contact time'));
        if (doc.data.containsKey('contact time')) {
          DateTime contactTime = (doc.data['contact time'] as Timestamp)
              .toDate(); // get last contact time
          // if time since contact is greater than threshold than remove the contact
          if (timeNow.difference(contactTime).inDays > threshold) {
            doc.reference.delete();
          }
        }
      }
    });

   // setState(() {});
  }

  void discovery() async {
    try {
      bool a = await Nearby().startDiscovery(loggedInUser.email, strategy,
          onEndpointFound: (id, name, serviceId) async {
        print('I saw id:$id with name:$name'); // the name here is an email

        var docRef =
            _firestore.collection('users').document(loggedInUser.email);

        //  When I discover someone I will see their email and add that email to the database of my contacts
        //  also get the current time & location and add it to the database
        docRef.collection('met_with').document(name).setData({
          'username': await getUsernameOfEmail(email: name),
          'contact time': DateTime.now(),
          'contact location': (await location.getLocation()).toString(),
        });
      }, onEndpointLost: (id) {
        print(id);
      });
      print('DISCOVERING: ${a.toString()}');
    } catch (e) {
      print(e);
    }
  }

  void getPermissions() {
    Nearby().askLocationAndExternalStoragePermission();
  }

  Future<String> getUsernameOfEmail({String email}) async {
    String res = '';
    await _firestore.collection('users').document(email).get().then((doc) {
      if (doc.exists) {
        res = doc.data['username'];
      } else {
        // doc.data() will be undefined in this case
        print("No such document!");
      }
    });
    return res;
  }

  Future<void> getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    deleteOldContacts(14);
    addContactsToList();
    getPermissions();
  }

  @override
  Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 5.0,
              color: Color(0xFF4082FF),
              onPressed: () async {
                try {
                  bool a = await Nearby().startAdvertising(
                    loggedInUser.email,
                    strategy,
                    onConnectionInitiated: null,
                    onConnectionResult: (id, status) {
                      print(status);
                    },
                    onDisconnected: (id) {
                      print('Disconnected $id');
                    },
                  );

                  print('ADVERTISING ${a.toString()}');
                } catch (e) {
                  print(e);
                }

                discovery();
              },
              child: Text(
                'Search Nearby',
                style: kButtonTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ContactCard(
                    imagePath: 'images/profile.png',
                    email: contactTraces[index],
                    infection: 'Not-Infected',
                    contactUsername: contactTraces[index],
                    contactTime: contactTimes[index],
                    contactLocation: contactLocations[index],
                  );
                },
                itemCount: contactTraces.length,
              ),
            ),
          ),
        ],
      );
  }
}
