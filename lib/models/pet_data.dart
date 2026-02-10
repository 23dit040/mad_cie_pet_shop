import 'pet.dart';

class PetData {
  static final List<Pet> pets = [
    Pet(
      id: '1',
      name: 'Golden Retriever',
      category: 'Dogs',
      image: 'assets/dogs/download.jpg',
      price: 500.0,
      breed: 'Golden Retriever',
      age: 2,
      description: 'Friendly and energetic dog perfect for families',
    ),
    Pet(
      id: '2',
      name: 'Labrador',
      category: 'Dogs',
      image: 'assets/dogs/download (1).jpg',
      price: 450.0,
      breed: 'Labrador',
      age: 1,
      description: 'Loyal and playful companion for active owners',
    ),
    Pet(
      id: '3',
      name: 'Bulldog',
      category: 'Dogs',
      image: 'assets/dogs/download (2).jpg',
      price: 600.0,
      breed: 'Bulldog',
      age: 3,
      description: 'Calm and gentle dog great for apartment living',
    ),
    Pet(
      id: '4',
      name: 'German Shepherd',
      category: 'Dogs',
      image: 'assets/dogs/download (3).jpg',
      price: 550.0,
      breed: 'German Shepherd',
      age: 2,
      description: 'Intelligent and protective family guardian',
    ),
    Pet(
      id: '5',
      name: 'Persian Cat',
      category: 'Cats',
      image: 'assets/cats/download.jpg',
      price: 300.0,
      breed: 'Persian',
      age: 1,
      description: 'Beautiful long-haired cat with gentle nature',
    ),
    Pet(
      id: '6',
      name: 'Siamese Cat',
      category: 'Cats',
      image: 'assets/cats/download (1).jpg',
      price: 250.0,
      breed: 'Siamese',
      age: 2,
      description: 'Smart and vocal cat with striking blue eyes',
    ),
    Pet(
      id: '7',
      name: 'British Shorthair',
      category: 'Cats',
      image: 'assets/cats/download (4).jpg',
      price: 400.0,
      breed: 'British Shorthair',
      age: 1,
      description: 'Calm and affectionate indoor companion',
    ),
    Pet(
      id: '8',
      name: 'Canary',
      category: 'Birds',
      image: 'assets/birds/download.jpg',
      price: 50.0,
      breed: 'Canary',
      age: 1,
      description: 'Beautiful singing bird with bright yellow feathers',
    ),
    Pet(
      id: '9',
      name: 'Parakeet',
      category: 'Birds',
      image: 'assets/birds/download (2).jpg',
      price: 80.0,
      breed: 'Parakeet',
      age: 1,
      description: 'Colorful and social bird perfect for beginners',
    ),
    Pet(
      id: '10',
      name: 'Cockatiel',
      category: 'Birds',
      image: 'assets/birds/images.jpg',
      price: 120.0,
      breed: 'Cockatiel',
      age: 2,
      description: 'Friendly bird with distinctive feather crest',
    ),
  ];

  static List<Pet> getPetsByCategory(String category) {
    return pets.where((pet) => pet.category == category).toList();
  }

  static Pet? getPetById(String id) {
    try {
      return pets.firstWhere((pet) => pet.id == id);
    } catch (e) {
      return null;
    }
  }
}
