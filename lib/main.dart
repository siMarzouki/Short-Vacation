import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import './models/trip.dart';
import './widgets/destinations.dart';
import './widgets/activites.dart';
import './widgets/appbar.dart';
import './widgets/bookbtn.dart';
import './data/data.dart';

void main() {
  //lock orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Short Vacation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int selectedDestination = 0;

class _MyHomePageState extends State<MyHomePage> {
  void updateSelectedDestination(int v) {
    setState(() {
      selectedDestination = v;
    });
  }

  void bookTrip(destinationIndex, date) {
    setState(() {
      Trip.addTrip(destinationIndex, date);
    });
  }

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return Scaffold(
      appBar: platform == TargetPlatform.iOS
          ? iosAppBar(Trip.getTrips().length)
          : androidAppBar(Trip.getTrips().length),
      body: SafeArea(
        child: ListView(
          children: [
            DestinationsWidget(selectedDestination, updateSelectedDestination),
            ActivitiesWidget(selectedDestination),
            BookBtn(selectedDestination, destinations[selectedDestination].city,
                destinations[selectedDestination].activities.length, bookTrip),
          ],
        ),
      ),
    );
  }
}
