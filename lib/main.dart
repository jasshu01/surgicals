import 'package:flutter/material.dart';

void main() {
  runApp(AashirvadSurgicalsApp());
}

class AashirvadSurgicalsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aashirvad Surgicals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 16, color: Colors.black87),
          bodyText2: TextStyle(fontSize: 14, color: Colors.black54),
          headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        cardColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: AashirvadSurgicalsHomePage(),
    );
  }
}

class AashirvadSurgicalsHomePage extends StatefulWidget {
  @override
  _AashirvadSurgicalsHomePageState createState() =>
      _AashirvadSurgicalsHomePageState();
}

class _AashirvadSurgicalsHomePageState
    extends State<AashirvadSurgicalsHomePage> {
  String selectedBrand = 'All Brands';

  // Sample data for products
  final List<Map<String, String>> products = [
    {'brand': 'Stryker', 'model': '1188 System', 'desc': 'Surgical Camera System'},
    {'brand': 'Stryker', 'model': '1288 System', 'desc': 'Advanced HD System'},
    {'brand': 'Stryker', 'model': '1488 System', 'desc': 'Endoscopy System'},
    {'brand': 'Stryker', 'model': '1588 System', 'desc': 'Medical Imaging System'},
    {'brand': 'Stryker', 'model': '1688 System', 'desc': 'Next Gen Surgical System'},
    {'brand': 'Smith & Nephew', 'model': '560P HD', 'desc': 'HD Camera System'},
    {'brand': 'Smith & Nephew', 'model': '4K System', 'desc': '4K Ultra HD Surgical System'},
    {'brand': 'Olympus', 'model': '180 System', 'desc': 'Surgical Camera'},
    {'brand': 'Olympus', 'model': '190 System', 'desc': 'Endoscopy System'},
    {'brand': 'Ethicon', 'model': 'Gen11', 'desc': 'Energy Device'},
    {'brand': 'Karl Storz', 'model': 'Image1 Hub', 'desc': 'Image Hub System'},
    {'brand': 'Karl Storz', 'model': 'Spies', 'desc': 'Advanced Imaging Platform'},
  ];

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
          onSelected: (bool selected) {
            setState(() {
              selectedBrand = brand;
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

  // Product Grid
  Widget _buildProductGrid() {
    var filteredProducts = selectedBrand == 'All Brands'
        ? products
        : products.where((product) => product['brand'] == selectedBrand).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 1200
            ? 4
            : constraints.maxWidth > 800
                ? 3
                : 2;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: filteredProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.1, // Adjusted for better layout
            ),
            itemBuilder: (context, index) {
              var product = filteredProducts[index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue[50],
                        ),
                        child: Icon(Icons.medical_services, size: 50, color: Colors.blue), // Placeholder for image
                      ),
                      SizedBox(height: 10),
                      Text(product['model'] ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(product['brand'] ?? '', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      Text(product['desc'] ?? '', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aashirvad Surgicals'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Introduction Section
            Container(
              color: Colors.blue[50],
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Aashirvad Surgicals',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'We are leading importers and exporters of high-quality surgical equipment. '
                    'Our products are trusted by surgeons and medical professionals worldwide, '
                    'designed for precision and reliability during critical operations.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Our Products',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We offer a wide range of medical systems, from surgical cameras to advanced imaging platforms, '
                    'to meet the needs of modern-day surgeries and operations. Browse our selection below:',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            // Filters
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildFilterChips(),
            ),
            SizedBox(height: 16),
            // Product Grid
            _buildProductGrid(),
            SizedBox(height: 50),
            // Contact Info Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Contact Us',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Phone: 6280012392',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Email: gargeximindia@gmail.com',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Aashirvad Surgicals | Your Trusted Partner in Surgical Solutions',
                    // style: Theme.of(context).textTheme.bodyText2.copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
