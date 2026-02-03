import 'package:flutter/material.dart';
import '../models/drink_model.dart';
import '../data/mock_data.dart';
import '../widgets/intention_chip.dart';
import '../widgets/category_card.dart';
import '../widgets/drink_card.dart';
import '../widgets/watermelon_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedIntention;
  String? selectedCategory;
  List<Drink> filteredDrinks = [];

  @override
  void initState() {
    super.initState();
    filteredDrinks = MockData.drinks;
  }

  void _filterByIntention(String? intention) {
    setState(() {
      selectedIntention = intention == selectedIntention ? null : intention;
      selectedCategory = null;
      _applyFilters();
    });
  }

  void _filterByCategory(String? category) {
    setState(() {
      selectedCategory = category == selectedCategory ? null : category;
      selectedIntention = null;
      _applyFilters();
    });
  }

  void _applyFilters() {
    if (selectedIntention != null) {
      filteredDrinks = MockData.drinks
          .where((drink) => drink.intentions.contains(selectedIntention))
          .toList();
    } else if (selectedCategory != null) {
      filteredDrinks = MockData.drinks
          .where((drink) => drink.category == selectedCategory)
          .toList();
    } else {
      filteredDrinks = MockData.drinks;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
                title: const Text(
                  'Bebidas Saludables',
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFE8F5E9),
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite_border, color: Color(0xFF2E7D32)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/favorites');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: const WatermelonAvatar(size: 40),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      '¿Qué necesitas hoy?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        IntentionChip(
                          label: 'Energía',
                          icon: Icons.bolt,
                          isSelected: selectedIntention == 'energía',
                          onTap: () => _filterByIntention('energía'),
                        ),
                        IntentionChip(
                          label: 'Desinflamar',
                          icon: Icons.spa,
                          isSelected: selectedIntention == 'desinflamar',
                          onTap: () => _filterByIntention('desinflamar'),
                        ),
                        IntentionChip(
                          label: 'Digestión',
                          icon: Icons.favorite,
                          isSelected: selectedIntention == 'digestión',
                          onTap: () => _filterByIntention('digestión'),
                        ),
                        IntentionChip(
                          label: 'Concentración',
                          icon: Icons.psychology,
                          isSelected: selectedIntention == 'concentración',
                          onTap: () => _filterByIntention('concentración'),
                        ),
                        IntentionChip(
                          label: 'Dormir',
                          icon: Icons.nightlight_round,
                          isSelected: selectedIntention == 'dormir',
                          onTap: () => _filterByIntention('dormir'),
                        ),
                        IntentionChip(
                          label: 'Saciedad',
                          icon: Icons.restaurant,
                          isSelected: selectedIntention == 'saciedad',
                          onTap: () => _filterByIntention('saciedad'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Categorías',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        CategoryCard(
                          title: 'Infusiones',
                          icon: Icons.local_cafe,
                          color: const Color(0xFF8D6E63),
                          isSelected: selectedCategory == 'Infusiones',
                          onTap: () => _filterByCategory('Infusiones'),
                        ),
                        CategoryCard(
                          title: 'Bebidas Detox',
                          icon: Icons.eco,
                          color: const Color(0xFF66BB6A),
                          isSelected: selectedCategory == 'Bebidas Detox',
                          onTap: () => _filterByCategory('Bebidas Detox'),
                        ),
                        CategoryCard(
                          title: 'Batidos Proteicos',
                          icon: Icons.fitness_center,
                          color: const Color(0xFF42A5F5),
                          isSelected: selectedCategory == 'Batidos Proteicos',
                          onTap: () => _filterByCategory('Batidos Proteicos'),
                        ),
                        CategoryCard(
                          title: 'Bebidas Digestivas',
                          icon: Icons.favorite,
                          color: const Color(0xFFEF5350),
                          isSelected: selectedCategory == 'Bebidas Digestivas',
                          onTap: () => _filterByCategory('Bebidas Digestivas'),
                        ),
                        CategoryCard(
                          title: 'Bebidas Energéticas',
                          icon: Icons.flash_on,
                          color: const Color(0xFFFFCA28),
                          isSelected: selectedCategory == 'Bebidas Energéticas',
                          onTap: () => _filterByCategory('Bebidas Energéticas'),
                        ),
                        CategoryCard(
                          title: 'Bebidas Relajantes',
                          icon: Icons.nights_stay,
                          color: const Color(0xFF9575CD),
                          isSelected: selectedCategory == 'Bebidas Relajantes',
                          onTap: () => _filterByCategory('Bebidas Relajantes'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedIntention != null
                              ? 'Para $selectedIntention'
                              : selectedCategory != null
                                  ? selectedCategory!
                                  : 'Todas las bebidas',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                        if (selectedIntention != null || selectedCategory != null)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedIntention = null;
                                selectedCategory = null;
                                filteredDrinks = MockData.drinks;
                              });
                            },
                            child: const Text('Limpiar filtro'),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return DrinkCard(
                      drink: filteredDrinks[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/drink-detail',
                          arguments: filteredDrinks[index].toMap(),
                        );
                      },
                    );
                  },
                  childCount: filteredDrinks.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}
