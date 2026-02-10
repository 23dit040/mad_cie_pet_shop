import 'package:flutter/material.dart';
import '../providers/cart_provider.dart';
import '../widgets/category_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (CartProvider().itemCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        '${CartProvider().itemCount}',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[900]!.withValues(alpha: 0.1), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to Pet Shop',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Find your perfect pet companion',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    CategoryCard(
                      title: 'Dogs',
                      icon: Icons.pets,
                      color: Colors.brown,
                      onTap: () => Navigator.pushNamed(context, '/category', arguments: 'Dogs'),
                    ),
                    CategoryCard(
                      title: 'Cats',
                      icon: Icons.pets,
                      color: Colors.purple,
                      onTap: () => Navigator.pushNamed(context, '/category', arguments: 'Cats'),
                    ),
                    CategoryCard(
                      title: 'Birds',
                      icon: Icons.flutter_dash,
                      color: Colors.blue,
                      onTap: () => Navigator.pushNamed(context, '/category', arguments: 'Birds'),
                    ),
                    CategoryCard(
                      title: 'All Pets',
                      icon: Icons.store,
                      color: Colors.green,
                      onTap: () => Navigator.pushNamed(context, '/category', arguments: 'All'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () => Navigator.pushNamed(context, '/add-pet'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

