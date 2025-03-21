class Recipe {
  final String name;
  final String imageUrl;
  final bool isVegan;
  final bool isGlutenFree;
  final bool isVegeterian;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.isVegan,
    required this.isGlutenFree,
    required this.isVegeterian,
    required this.ingredients,
    required this.steps,
  });
}
