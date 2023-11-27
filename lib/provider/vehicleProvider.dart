import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/vehicleModel.dart';

class VehicleProvider extends ChangeNotifier {
  List<Results> _vehicles = [];
  bool _isLoading = false;

  List<Results> get vehicles => _vehicles;
  bool get isLoading => _isLoading;

  Future<void> fetchVehicles() async {
    try {
      _isLoading = true;
      notifyListeners();

      final response =
          await http.get(Uri.parse('https://swapi.dev/api/vehicles/'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
        _vehicles = data.map((item) => Results.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load vehicles');
      }
    } catch (error) {
      // Handle errors as needed
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
