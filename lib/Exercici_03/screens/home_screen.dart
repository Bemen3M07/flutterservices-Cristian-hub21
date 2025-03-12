import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';
import '../widgets/car_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Coches")),
      body: carProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : carProvider.cars.isEmpty
              ? Center(
                  child: ElevatedButton(
                    onPressed: carProvider.fetchCars,
                    child: const Text("Cargar coches"),
                  ),
                )
              : const CarList(),
    );
  }
}
