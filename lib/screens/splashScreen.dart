import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/vehicleProvider.dart';
import 'HomeSCreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      _initAsync(context);
    });
    super.initState();
  }

  Future<void> _initAsync(BuildContext context) async {
    await Provider.of<VehicleProvider>(context, listen: false).fetchVehicles();
    if (!Provider.of<VehicleProvider>(context, listen: false).isLoading) {
      Future.delayed(const Duration(seconds: 2), () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Provider.of<VehicleProvider>(context);
    return Scaffold(
      body: vehicleProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(child: Image.asset("assets/flutter_logo.jpg")),
    );
  }
}
