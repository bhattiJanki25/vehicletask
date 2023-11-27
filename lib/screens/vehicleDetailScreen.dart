import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/vehicleModel.dart';

class VehicleDetailScreen extends StatefulWidget {
  final Results vehicle;

  VehicleDetailScreen({required this.vehicle});

  @override
  State<VehicleDetailScreen> createState() => _VehicleDetailScreenState();
}

class _VehicleDetailScreenState extends State<VehicleDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Set the duration of the animation
    );

    // Create a Tween for the slide animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0), // Start from the top
      end: Offset.zero, // End at the center
    ).animate(_controller);

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'vehicleName${widget.vehicle.name}',
          child: Material(
            color: Colors.transparent,
            child: Text(widget.vehicle.name.toString()),
          ),
        ),
      ),
      body: SlideTransition(
        position: _slideAnimation,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Text(
                widget.vehicle.name.toString(),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
