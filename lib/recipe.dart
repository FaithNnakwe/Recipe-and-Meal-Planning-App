class Recipe {
  String name;
  bool isVegan;
  bool isGlutenFree;
  bool isVegetarian;
  String imageUrl;
  List<String> ingredients;
  List<String> steps;

  Recipe({
    required this.name,
    required this.isVegan,
    required this.isGlutenFree,
    required this.isVegetarian,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
  });
}
