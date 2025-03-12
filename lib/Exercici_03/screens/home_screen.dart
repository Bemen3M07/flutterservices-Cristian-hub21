import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';
import '../widgets/car_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Lista de Coches")),
      body: carProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : carProvider.cars.isEmpty
              ? Center(
                  child: ElevatedButton(
                    onPressed: carProvider.fetchCars,
                    child: Text("Cargar coches"),
                  ),
                )
              : CarList(),
    );
  }
}
