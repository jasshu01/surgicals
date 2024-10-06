import 'package:flutter/material.dart';
import 'package:surgicals/data/products_data.dart';
import '../models/product_model.dart';
import 'dart:html' as html; // For web-specific functionalities

class ProductGrid extends StatelessWidget {
  final String selectedBrand;

  ProductGrid({required this.selectedBrand});

  @override
  Widget build(BuildContext context) {
    // Filter products based on the selected brand
    List<Product> filteredProducts = selectedBrand == 'All Brands'
        ? products
        : products.where((product) => product.brand == selectedBrand).toList();

    if (filteredProducts.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'No products available for the selected brand.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Use SliverGridDelegateWithMaxCrossAxisExtent for better responsiveness
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: filteredProducts.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350, // Maximum width of each grid item
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 0.75, // Adjust as needed
            ),
            itemBuilder: (context, index) {
              Product product = filteredProducts[index];
              return ProductCard(product: product);
            },
          ),
        );
      },
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isHovered = false;
  bool _isLoading = true; // Track loading state

  // Function to handle 'Call Now' button press
  void _callNow() {
    html.window.open('tel:6280012392', '_self');
  }

  @override
  Widget build(BuildContext context) {
    // Determine screen width for responsive adjustments
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust font sizes based on screen width
    double modelFontSize = screenWidth < 600 ? 18 : 20;
    double brandFontSize = screenWidth < 600 ? 14 : 16;
    double descriptionFontSize = screenWidth < 600 ? 12 : 14;

    return MouseRegion(
      onEnter: (_) {
        if (screenWidth > 600) {
          setState(() {
            _isHovered = true;
          });
        }
      },
      onExit: (_) {
        if (screenWidth > 600) {
          setState(() {
            _isHovered = false;
          });
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12.0,
                    offset: Offset(0, 6),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                ],
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          border: Border.all(
            color: _isHovered ? Colors.blueAccent : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image with flexible height
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Container(
                height: 200,
                color: Colors.grey[200],
                child: Stack(
                  children: [
                    Image.asset(
                      widget.product.imagePath,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      semanticLabel: '${widget.product.model} image',
                      // Setting the loading state when image loads
                      frameBuilder: (BuildContext context, Widget child,
                          int? frame, bool wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) {
                          return child;
                        }
                        if (frame == null) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        // Image loaded
                        _isLoading = false; // Update loading state
                        return child;
                      },
                      // Error handling for image loading
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey[400],
                          ),
                        );
                      },
                    ),
                    if (_isLoading) // Show loading indicator
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
            ),
            // Product Information
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Model
                  Text(
                    widget.product.model,
                    style: TextStyle(
                      fontSize: modelFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.0),
                  // Product Brand
                  Text(
                    widget.product.brand,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: brandFontSize,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  // Product Description
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: descriptionFontSize,
                    ),
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.0),
                  // "Call Now" Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _callNow,
                      icon: Icon(Icons.phone, color: Colors.white),
                      label: Text(
                        'Call Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 20.0),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
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
