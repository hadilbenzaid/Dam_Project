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

class Constantine extends StatefulWidget {
  const Constantine({super.key});

  @override
  State<Constantine> createState() => _ConstantineState();
}

class _ConstantineState extends State<Constantine> {
  final List<Category> categories = [
    Category(
      name: 'Restaurants',
      icon: Icons.restaurant,
      restaurants: [
        Restaurant(
          name: 'Le Bey Restaurant',
          imageUrl: 'assets/images/lebey.jpg', // You'll need to add these images
          phone: '+213 31 92 45 45',
          description: 'Restaurant raffiné avec une vue panoramique sur Constantine. Spécialisé dans la cuisine traditionnelle et moderne.',
          address: 'Hôtel Novotel Constantine, Route de l\'aéroport, Constantine',
          rating: 4.5,
        ),
        Restaurant(
          name: 'La Grotte Restaurant',
          imageUrl: 'assets/images/lagrotte.jpg',
          phone: '+213 31 92 33 33',
          description: 'Restaurant emblématique avec une architecture unique en grotte. Cuisine locale et internationale.',
          address: 'Rue Larbi Ben M\'hidi, Constantine',
          rating: 4.3,
        ),
        Restaurant(
          name: 'Restaurant Zephyr',
          imageUrl: 'assets/images/zephyr.jpg',
          phone: '+213 31 94 62 14',
          description: 'Vue imprenable sur la ville, cuisine méditerranéenne raffinée et ambiance élégante.',
          address: 'Hôtel Ibis Constantine, Boulevard Zaamouche Ali',
          rating: 4.4,
        ),
      ],
    ),
    Category(
      name: 'Pizza',
      icon: Icons.local_pizza,
      restaurants: [
        Restaurant(
          name: 'Pizza Time',
          imageUrl: 'assets/images/pizzatime.jpg',
          phone: '+213 31 90 12 34',
          description: 'Les meilleures pizzas artisanales de Constantine. Large choix de garnitures fraîches.',
          address: 'Avenue Aouati Mostefa, Constantine',
          rating: 4.2,
        ),
        Restaurant(
          name: 'Venezia Pizza',
          imageUrl: 'assets/images/venezia.jpg',
          phone: '+213 31 91 23 45',
          description: 'Pizzeria authentique avec des recettes traditionnelles italiennes adaptées aux goûts locaux.',
          address: 'Rue Larbi Ben M\'hidi, Constantine',
          rating: 4.1,
        ),
      ],
    ),
    Category(
      name: 'Desserts',
      icon: Icons.cake,
      restaurants: [
        Restaurant(
          name: 'Délices de Constantine',
          imageUrl: 'assets/images/delices.jpg',
          phone: '+213 31 93 45 67',
          description: 'Pâtisserie traditionnelle constantinoise. Spécialités : Makrout, Baklava, et gâteaux modernes.',
          address: 'Boulevard de l\'Indépendance, Constantine',
          rating: 4.6,
        ),
        Restaurant(
          name: 'Sweet House',
          imageUrl: 'assets/images/sweethouse.jpg',
          phone: '+213 31 94 56 78',
          description: 'Salon de thé moderne proposant des pâtisseries traditionnelles et internationales.',
          address: 'Rue Kitouni Abdelmalek, Constantine',
          rating: 4.3,
        ),
      ],
    ),
    Category(
      name: 'Cafeteria',
      icon: Icons.coffee,
      restaurants: [
        Restaurant(
          name: 'Café des Ponts',
          imageUrl: 'assets/images/cafedesponts.jpg',
          phone: '+213 31 95 67 89',
          description: 'Café historique avec vue sur le pont Sidi M\'Cid. Ambiance authentique.',
          address: 'Boulevard Zighoud Youcef, Constantine',
          rating: 4.4,
        ),
        Restaurant(
          name: 'Le Cirta Café',
          imageUrl: 'assets/images/cirta.jpg',
          phone: '+213 31 96 78 90',
          description: 'Café moderne avec terrasse. Excellent café et pâtisseries maison.',
          address: 'Avenue de l\'ALN, Constantine',
          rating: 4.2,
        ),
      ],
    ),
    Category(
      name: 'Fast Food',
      icon: Icons.fastfood,
      restaurants: [
        Restaurant(
          name: 'Royal Burger',
          imageUrl: 'assets/images/royalburger.jpg',
          phone: '+213 31 97 89 01',
          description: 'Meilleurs burgers de la ville avec des ingrédients frais et locaux.',
          address: 'Rue Bebars, Constantine',
          rating: 4.0,
        ),
      ],
    ),
  ];

  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constantine'),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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