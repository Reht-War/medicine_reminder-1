import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medicine_reminder/PatientScreen/Notif2Patient/core/viewmodels/home_model.dart';
import 'package:medicine_reminder/PatientScreen/Notif2Patient/ui/views/home_view.dart';


class mainSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}