import 'package:flutter/material.dart';
import '../models/pet_data.dart';
import '../models/pet.dart';
import '../providers/cart_provider.dart';
import '../widgets/pet_card.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  void showPetDetails(BuildContext context, Pet pet) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => PetDetailsModal(pet: pet),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String category = ModalRoute.of(context)!.settings.arguments as String;
    final List<Pet> pets = category == 'All' 
        ? PetData.pets 
        : PetData.getPetsByCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
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
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: pets.length,
        itemBuilder: (context, index) {
          final pet = pets[index];
          return GestureDetector(
            onTap: () => showPetDetails(context, pet),
            child: PetCard(pet: pet),
          );
        },
      ),
    );
  }
}

class PetDetailsModal extends StatefulWidget {
  final Pet pet;

  const PetDetailsModal({super.key, required this.pet});

  @override
  State<PetDetailsModal> createState() => _PetDetailsModalState();
}

class _PetDetailsModalState extends State<PetDetailsModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.pet.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.pet.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.pets, size: 80, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '\$${widget.pet.price.toInt()}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            InfoRow(label: 'Breed', value: widget.pet.breed),
            InfoRow(label: 'Age', value: '${widget.pet.age} years'),
            InfoRow(label: 'Category', value: widget.pet.category),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.pet.description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  CartProvider().addToCart(widget.pet);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${widget.pet.name} added to cart!'),
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  foregroundColor: Colors.white,
                ),
                child: const Text('Add to Cart', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(value, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }
}

