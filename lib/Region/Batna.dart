import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final List<Restaurant> restaurants;

  Category({required this.name, required this.icon, required this.restaurants});
}

class Restaurant {
  final String name;
  final String imageUrl;
  final String phone;
  final String description;
  final String address;
  final double rating;

  Restaurant({
    required this.name,
    required this.imageUrl,
    required this.phone,
    required this.description,
    required this.address,
    required this.rating,
  });
}

class Batna extends StatefulWidget {
  const Batna({super.key});

  @override
  State<Batna> createState() => _BatnaState();
}

class _BatnaState extends State<Batna> {
  final List<Category> categories = [
    Category(
      name: 'Restaurants',
      icon: Icons.restaurant,
      restaurants: [
        Restaurant(
          name: 'Restaurant Chelia',
          imageUrl: 'assets/images/chelia.jpg', // You'll need to add these images
          phone: '+213 33 85 41 23',
          description: 'Restaurant traditionnel avec une vue magnifique sur les montagnes des Aurès. Spécialités locales et cuisine traditionnelle.',
          address: 'Route de Tazoult, Batna',
          rating: 4.5,
        ),
        Restaurant(
          name: 'Le Petit Timgad',
          imageUrl: 'assets/images/timgad.jpg',
          phone: '+213 33 86 54 32',
          description: 'Restaurant élégant proposant des plats traditionnels des Aurès et une cuisine méditerranéenne raffinée.',
          address: 'Avenue de l\'Indépendance, Batna',
          rating: 4.3,
        ),
        Restaurant(
          name: 'Auberge des Aurès',
          imageUrl: 'assets/images/aures.jpg',
          phone: '+213 33 87 65 43',
          description: 'Cadre authentique avec une cuisine locale. Spécialités : couscous, méchoui et plats traditionnels.',
          address: 'Boulevard des Aurès, Batna',
          rating: 4.4,
        ),
      ],
    ),
    Category(
      name: 'Pizza',
      icon: Icons.local_pizza,
      restaurants: [
        Restaurant(
          name: 'Pizza Belvedere',
          imageUrl: 'assets/images/belvedere.jpg',
          phone: '+213 33 88 76 54',
          description: 'Pizzeria réputée servant des pizzas artisanales avec une vue panoramique sur la ville.',
          address: 'Rue des Frères Boukhlouf, Batna',
          rating: 4.2,
        ),
        Restaurant(
          name: 'Roma Pizza',
          imageUrl: 'assets/images/roma.jpg',
          phone: '+213 33 89 87 65',
          description: 'Pizzas authentiques italiennes et cuisine méditerranéenne dans un cadre moderne.',
          address: 'Avenue de la République, Batna',
          rating: 4.1,
        ),
      ],
    ),
    Category(
      name: 'Desserts',
      icon: Icons.cake,
      restaurants: [
        Restaurant(
          name: 'Pâtisserie des Aurès',
          imageUrl: 'assets/images/patisserie.jpg',
          phone: '+213 33 90 98 76',
          description: 'Pâtisserie traditionnelle proposant des gâteaux locaux et modernes. Spécialité : Bradj et Makrout.',
          address: 'Rue Ben Boulaid, Batna',
          rating: 4.6,
        ),
        Restaurant(
          name: 'Délices de Batna',
          imageUrl: 'assets/images/delicesbatna.jpg',
          phone: '+213 33 91 09 87',
          description: 'Salon de thé et pâtisserie offrant un mélange de saveurs traditionnelles et modernes.',
          address: 'Avenue du 1er Novembre, Batna',
          rating: 4.3,
        ),
      ],
    ),
    Category(
      name: 'Cafeteria',
      icon: Icons.coffee,
      restaurants: [
        Restaurant(
          name: 'Café de la Place',
          imageUrl: 'assets/images/cafeplace.jpg',
          phone: '+213 33 92 10 98',
          description: 'Café historique au cœur de Batna. Ambiance chaleureuse et traditionnelle.',
          address: 'Place du 1er Novembre, Batna',
          rating: 4.4,
        ),
        Restaurant(
          name: 'Le Timgad Café',
          imageUrl: 'assets/images/timgadcafe.jpg',
          phone: '+213 33 93 21 09',
          description: 'Café moderne avec terrasse offrant une vue sur la ville. Excellent café et pâtisseries.',
          address: 'Route de Tazoult, Batna',
          rating: 4.2,
        ),
      ],
    ),
    Category(
      name: 'Fast Food',
      icon: Icons.fastfood,
      restaurants: [
        Restaurant(
          name: 'Aures Burger',
          imageUrl: 'assets/images/aureshouse.jpg',
          phone: '+213 33 94 32 10',
          description: 'Fast-food local proposant des burgers avec une touche traditionnelle des Aurès.',
          address: 'Rue Ali Nemer, Batna',
          rating: 4.0,
        ),
        Restaurant(
          name: 'Chicken House',
          imageUrl: 'assets/images/chickenhouse.jpg',
          phone: '+213 33 95 43 21',
          description: 'Spécialités de poulet grillé et fast-food dans un cadre moderne.',
          address: 'Avenue de l\'ALN, Batna',
          rating: 4.1,
        ),
      ],
    ),
  ];

  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Batna'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // Categories Section
          Container(
            height: 120,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index];
                    });
                  },
                  child: Container(
                    width: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: selectedCategory == categories[index]
                          ? Colors.orange
                          : Colors.orange[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          categories[index].icon,
                          color: selectedCategory == categories[index]
                              ? Colors.white
                              : Colors.orange,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            color: selectedCategory == categories[index]
                                ? Colors.white
                                : Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Restaurants List
          Expanded(
            child: selectedCategory == null
                ? const Center(
              child: Text(
                'Sélectionnez une catégorie pour voir les restaurants',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: selectedCategory!.restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = selectedCategory!.restaurants[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(4),
                        ),
                        child: Image.asset(
                          restaurant.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    restaurant.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      restaurant.rating.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.orange,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    restaurant.address,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: Colors.orange,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  restaurant.phone,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              restaurant.description,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
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
    );
  }
}