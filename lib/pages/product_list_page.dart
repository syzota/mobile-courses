import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_model.dart';
import 'cart_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String searchQuery = '';
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
        id: '1',
        name: 'Midnight Memories',
        price: 1500000,
        imagePath: 'assets/images/midnight.jpg',
        description: 'Third studi album by One Direction',
        category: 'British Band',
      ),
      Product(
        id: '2',
        name: 'Youngblood',
        price: 800000,
        imagePath: 'assets/images/blood.jpg',
        description: 'Third studio album by 5 Seconds of Summer',
        category: 'Australian Band',
      ),
      Product(
        id: '3',
        name: 'Made in the A.M.',
        price: 1500000,
        imagePath: 'assets/images/mitam.jpg',
        description: 'Fifth studio album by One Direction',
        category: 'British Band',
      ),
      Product(
        id: '4',
        name: 'Sounds Good Feels Good',
        price: 800000,
        imagePath: 'assets/images/sgfg.jpg',
        description: 'Second studio album by 5 Seconds of Summer',
        category: 'Australian Band',
      ),
      Product(
        id: '5',
        name: 'Take Me Home',
        price: 1500000,
        imagePath: 'assets/images/tmh.jpg',
        description: 'Second studio album by One Direction',
        category: 'British Band',
      ),
      Product(
        id: '6',
        name: '5 Seconds of Summer',
        price: 800000,
        imagePath: 'assets/images/5sos.jpg',
        description: 'Second studio album by 5 Seconds of Summer',
        category: 'Australian Band',
      ),
    ];

    final categories = ['All', 'Australian Band', 'British Band'];

    final filteredProducts = products.where((product) {
      final matchesSearch = product.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      final matchesCategory =
          selectedCategory == 'All' || product.category == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${cart.itemCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // SEARCH
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search your favorite album...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),

            const SizedBox(height: 12),

            // CATEGORY DROPDOWN
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Category',
              ),
              items: categories
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),

            const SizedBox(height: 16),

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];

                  return Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(
                                product.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Rp ${product.price.toStringAsFixed(0)}',
                                style: TextStyle(color: Colors.green[700]),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<CartModel>().addItem(product);
                                },
                                child: const Text('Add'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
