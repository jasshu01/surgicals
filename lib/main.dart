import 'package:flutter/material.dart';
import 'ui/product_grid.dart';
import 'ui/header.dart';
import 'ui/footer.dart';

void main() {
  runApp(AshirvaadSurgicalsApp());
}

class AshirvaadSurgicalsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ashirvaad Surgicals',
      debugShowCheckedModeBanner: false,
      home: AshirvaadSurgicalsHomePage(),
    );
  }
}

class AshirvaadSurgicalsHomePage extends StatefulWidget {
  @override
  _AshirvaadSurgicalsHomePageState createState() =>
      _AshirvaadSurgicalsHomePageState();
}

class _AshirvaadSurgicalsHomePageState
    extends State<AshirvaadSurgicalsHomePage> {
  String selectedBrand = 'All Brands';

  // Brand filter
  final List<String> brands = [
    'All Brands',
    'Stryker',
    'Smith & Nephew',
    'Olympus',
    'Ethicon',
    'Karl Storz'
  ];

  // Product filtering based on selected brand
  Widget _buildFilterChips() {
    return Wrap(
      spacing: 8.0,
      children: brands.map((brand) {
        return ChoiceChip(
          label: Text(brand),
          selected: selectedBrand == brand,
          onSelected: (selected) {
            setState(() {
              selectedBrand = selected ? brand : 'All Brands';
            });
          },
          selectedColor: Colors.blue[400],
          backgroundColor: Colors.grey[300],
          labelStyle: TextStyle(
            color: selectedBrand == brand ? Colors.white : Colors.black,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed default AppBar to use a custom header
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(), // Custom Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildFilterChips(),
            ),
            ProductGrid(selectedBrand: selectedBrand), // Product Grid
            Footer(), // Custom Footer
          ],
        ),
      ),
    );
  }
}
