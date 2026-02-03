class Drink {
  final String id;
  final String name;
  final String category;
  final List<String> intentions;
  final String description;
  final List<String> benefits;
  final Map<String, double> micronutrients; // name -> %VD
  final Map<String, bool> compatibility; // SIBO, colitis, FODMAP, etc.
  final List<String> warnings;
  final String idealTime;
  final NutritionalInfo nutritionalInfo;
  final List<String> ingredients;
  final String preparation;
  final String imageUrl;
  final double rating;
  final bool isFavorite;

  Drink({
    required this.id,
    required this.name,
    required this.category,
    required this.intentions,
    required this.description,
    required this.benefits,
    required this.micronutrients,
    required this.compatibility,
    required this.warnings,
    required this.idealTime,
    required this.nutritionalInfo,
    required this.ingredients,
    required this.preparation,
    required this.imageUrl,
    this.rating = 0.0,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'intentions': intentions,
      'description': description,
      'benefits': benefits,
      'micronutrients': micronutrients,
      'compatibility': compatibility,
      'warnings': warnings,
      'idealTime': idealTime,
      'nutritionalInfo': nutritionalInfo.toMap(),
      'ingredients': ingredients,
      'preparation': preparation,
      'imageUrl': imageUrl,
      'rating': rating,
      'isFavorite': isFavorite,
    };
  }

  factory Drink.fromMap(Map<String, dynamic> map) {
    return Drink(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      intentions: List<String>.from(map['intentions'] ?? []),
      description: map['description'] ?? '',
      benefits: List<String>.from(map['benefits'] ?? []),
      micronutrients: Map<String, double>.from(map['micronutrients'] ?? {}),
      compatibility: Map<String, bool>.from(map['compatibility'] ?? {}),
      warnings: List<String>.from(map['warnings'] ?? []),
      idealTime: map['idealTime'] ?? '',
      nutritionalInfo: NutritionalInfo.fromMap(map['nutritionalInfo'] ?? {}),
      ingredients: List<String>.from(map['ingredients'] ?? []),
      preparation: map['preparation'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      rating: (map['rating'] ?? 0.0).toDouble(),
      isFavorite: map['isFavorite'] ?? false,
    );
  }
}

class NutritionalInfo {
  final double calories;
  final double carbs;
  final double sugars;
  final double protein;
  final double fat;
  final double fiber;
  final double sodium;

  NutritionalInfo({
    required this.calories,
    required this.carbs,
    required this.sugars,
    required this.protein,
    required this.fat,
    required this.fiber,
    required this.sodium,
  });

  Map<String, dynamic> toMap() {
    return {
      'calories': calories,
      'carbs': carbs,
      'sugars': sugars,
      'protein': protein,
      'fat': fat,
      'fiber': fiber,
      'sodium': sodium,
    };
  }

  factory NutritionalInfo.fromMap(Map<String, dynamic> map) {
    return NutritionalInfo(
      calories: (map['calories'] ?? 0.0).toDouble(),
      carbs: (map['carbs'] ?? 0.0).toDouble(),
      sugars: (map['sugars'] ?? 0.0).toDouble(),
      protein: (map['protein'] ?? 0.0).toDouble(),
      fat: (map['fat'] ?? 0.0).toDouble(),
      fiber: (map['fiber'] ?? 0.0).toDouble(),
      sodium: (map['sodium'] ?? 0.0).toDouble(),
    );
  }
}
