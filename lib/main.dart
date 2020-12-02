// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:medicine_reminder/FrontOnboarding/FrontMainOnboarding.dart';
// import 'package:medicine_reminder/PatientController/DaySelector/DaySelector.dart';
// import 'package:medicine_reminder/PatientController/PatientAddPage.dart';
// import 'package:medicine_reminder/LaunchScreen/demo.dart';
// import 'package:medicine_reminder/PatientList/FullPatientDetails/FullPatientDetails.dart';
//
// import 'package:medicine_reminder/PatientList/PhasePage.dart';
// import 'package:medicine_reminder/PatientList/SelfReminder/Selfmain.dart';
// import 'package:medicine_reminder/PatientScreen/CountDownTimer/CountDown.dart';
// import 'package:medicine_reminder/PatientScreen/demo.dart';
// import 'package:medicine_reminder/StoreLocator/StoreLocator.dart';
//
// // import 'package:medicine_reminder/PatientScreen/Onboarding.dart';
//
// import 'package:medicine_reminder/Timer/SelectDay/SelectDay.dart';
//
// // import 'package:medicine_reminder/LaunchScreen/gooey_edge/lib/demo.dart';
// // import 'package:medicine_reminder/2NewPatient.dart';
// // import 'package:medicine_reminder/timer/SelectTime.dart';
// // import 'package:medicine_reminder/enhancements/FirstPage.dart';
// import 'package:medicine_reminder/navigation.dart';
// import 'package:medicine_reminder/Enhancements/PreviewAuth.dart';
//
// import 'PatientController/PatientAddPage.dart';
//
// // import 'LaunchScreen/Launch.dart';
//
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   Paint.enableDithering = true;
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   MyApp();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Digital Medical Assistant',
//         home: StoreLocator());
//   }
// }


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medicine_reminder/PatientList/PhasePage.dart';

import 'package:medicine_reminder/StoreLocator/models/place.dart';
import 'package:medicine_reminder/StoreLocator/screens/search.dart';
import 'package:medicine_reminder/StoreLocator/services/geolocator_service.dart';
import 'package:medicine_reminder/StoreLocator/services/places_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

// void main() => runApp(StoreLocator());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placesService = PlacesService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation()),
        FutureProvider(create: (context) {
          ImageConfiguration configuration = createLocalImageConfiguration(context);
          return BitmapDescriptor.fromAssetImage(configuration, 'assets/images/parking-icon.png');
        }),
        ProxyProvider2<Position,BitmapDescriptor,Future<List<Place>>>(
          update: (context,position,icon,places){
            return (position !=null) ? placesService.getPlaces(position.latitude, position.longitude,icon) :null;
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Medical Assistant',
        home: PhasePage()
      ),
    );
  }
}