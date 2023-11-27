import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicletask/screens/vehicleDetailScreen.dart';

import '../model/vehicleModel.dart';
import '../provider/vehicleProvider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Provider.of<VehicleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: ListView.builder(
        itemCount: vehicleProvider.vehicles.length,
        itemBuilder: (context, index) {
          final Results vehicle = vehicleProvider.vehicles[index];
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return VehicleDetailScreen(vehicle: vehicle);
                    },
                  ),
                );
              },
              title: Hero(
                  tag: 'vehicleName${vehicle.name}',
                  child: Material(
                      color: Colors.transparent,
                      child: Text(vehicle.name.toString()))),
              subtitle: Text(vehicle.model.toString()),
            ),
          );
        },
      ),
    );
  }
}
