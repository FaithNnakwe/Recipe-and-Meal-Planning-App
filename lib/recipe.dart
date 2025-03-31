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

  // Convert Recipe to Map to make database easier
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'isVegan': isVegan ? 1 : 0, // Convert bool to int for database storage
      'isGlutenFree': isGlutenFree ? 1 : 0,
      'isVegetarian': isVegetarian ? 1 : 0,
      'ingredientsCount': ingredients.length,
      'ingredients': ingredients,
      'steps': steps,
    };
  }

  // Factory constructor to create a Recipe from a map
  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      name: map['name'] ?? '', // Default to empty string if null
      imageUrl: map['imageUrl'] ?? '', // Default to empty string if null
      isVegan: map['isVegan'] == 1, // Convert from 1/0 to bool
      isGlutenFree: map['isGlutenFree'] == 1, // Convert from 1/0 to bool
      isVegetarian: map['isVegetarian'] == 1, // Convert from 1/0 to bool
      ingredients: List<String>.from(
        map['ingredients'] ?? [],
      ), // Convert ingredients to a list of strings, default to empty if null
      steps: List<String>.from(map['steps'] ?? []),
    );
  }
}

List<Recipe> recipes = [
  Recipe(
    name: 'Vegetable Stir-Fry',
    imageUrl: 'assets/vegetable_stir_fry.jpeg',
    isVegan: true,
    isGlutenFree: true,
    isVegetarian: true,
    ingredients: [
      '1 Bell pepper (sliced)',
      '1 head of Broccoli (cut into florets)',
      '2 Carrots (peeled and sliced)',
      '1 Onion (sliced)',
      '2 tbsp Soy sauce (gluten-free)',
      '2 tbsp Olive oil',
      '1 tsp Sesame oil (optional)',
      '1 clove Garlic (minced)',
      '1 tsp Ginger (grated, optional)',
      '1 tbsp Sesame seeds (optional, for garnish)',
      'Cooked rice or noodles (for serving)',
    ],
    steps: [
      '1. Heat the olive oil and sesame oil (if using) in a large pan or wok over medium heat.',
      '2. Add the sliced onion, bell pepper, and grated ginger (if using). Sauté for 2-3 minutes until the vegetables begin to soften.',
      '3. Add the sliced carrots and broccoli florets to the pan. Continue cooking and stirring for 5-7 minutes until the vegetables are tender but still crisp.',
      '4. Add minced garlic to the pan and cook for an additional 1 minute until fragrant.',
      '5. Pour the soy sauce over the vegetables and stir well to coat them evenly.',
      '6. Serve the stir-fry over cooked rice or noodles and garnish with sesame seeds, if desired.',
      '7. Enjoy your delicious, healthy vegetable stir-fry!',
    ],
  ),

  Recipe(
    name: 'Grilled Salmon',
    imageUrl: 'assets/grilled_salmon.jpeg',
    isVegan: false,
    isGlutenFree: true,
    isVegetarian: false,
    ingredients: [
      '2 Salmon fillets',
      '1 Lemon (cut into wedges)',
      '2 cloves Garlic (minced)',
      '1 tbsp Olive oil',
      '1 tsp Salt',
      '1/2 tsp Pepper',
      '1 tsp Fresh dill (optional, for garnish)',
    ],
    steps: [
      '1. Preheat your grill to medium-high heat.',
      '2. Brush the salmon fillets with olive oil and season with salt, pepper, and minced garlic.',
      '3. Place the salmon fillets on the grill, skin-side down, and grill for 4-5 minutes on each side. The fish is done when it flakes easily with a fork and has an internal temperature of 145°F (63°C).',
      '4. Remove the salmon from the grill and let it rest for a few minutes.',
      '5. Squeeze fresh lemon juice over the salmon fillets for added flavor.',
      '6. Garnish with fresh dill and serve with your favorite sides, like roasted vegetables or a simple salad.',
      '7. Enjoy your perfectly grilled salmon!',
    ],
  ),

  Recipe(
    name: 'Pasta Primavera',
    imageUrl: 'assets/pasta_primavera.jpeg',
    isVegan: true,
    isGlutenFree: false,
    isVegetarian: true,
    ingredients: [
      '8 oz Pasta (spaghetti, penne, or gluten-free pasta)',
      '1 Cup Cherry tomatoes (halved)',
      '1 Zucchini (sliced)',
      '2 Cups Fresh spinach (chopped)',
      '2 cloves Garlic (minced)',
      '2 tbsp Olive oil',
      '1/2 tsp Salt',
      '1/4 tsp Pepper',
      '1/4 Cup Fresh basil (chopped)',
      'Nutritional yeast or vegan cheese (optional, for topping)',
    ],
    steps: [
      '1. Cook the pasta according to package instructions, then drain and set aside.',
      '2. While the pasta is cooking, heat the olive oil in a large skillet over medium heat.',
      '3. Add minced garlic and sauté for 1-2 minutes, until fragrant.',
      '4. Add the zucchini slices and cherry tomatoes to the skillet and cook for 3-4 minutes, until they begin to soften.',
      '5. Stir in the fresh spinach and cook until wilted, about 2 minutes.',
      '6. Season with salt and pepper, and then toss the cooked pasta into the skillet with the vegetables.',
      '7. Stir in fresh basil and mix everything together.',
      '8. Serve with a sprinkle of nutritional yeast or vegan cheese if desired, and enjoy your light and fresh pasta primavera!',
    ],
  ),

  Recipe(
    name: 'Beef Tacos',
    imageUrl: 'assets/beef_tacos.jpeg',
    isVegan: false,
    isGlutenFree: false,
    isVegetarian: false,
    ingredients: [
      '1 lb Ground beef',
      '1 Packet Taco seasoning mix',
      '10 Taco shells',
      '1/2 Cup Shredded lettuce',
      '1/2 Cup Shredded cheese (cheddar or Mexican blend)',
      '1/4 Cup Sour cream',
      '1/4 Cup Salsa',
      '1 Tomato (diced)',
      '1/4 Cup Chopped onions (optional)',
      '1 tbsp Olive oil (for cooking the beef)',
    ],
    steps: [
      '1. Heat olive oil in a large skillet over medium heat.',
      '2. Add the ground beef and cook until browned, breaking it apart with a spatula as it cooks (about 7-8 minutes). Drain any excess fat.',
      '3. Stir in the taco seasoning mix and follow the instructions on the packet (usually adding water and simmering for 3-5 minutes).',
      '4. While the beef simmers, warm the taco shells in the oven according to the package instructions.',
      '5. Once the beef is ready, spoon it into the warmed taco shells.',
      '6. Top each taco with shredded lettuce, cheese, diced tomato, sour cream, and salsa.',
      '7. Optionally, add chopped onions for extra flavor.',
      '8. Serve with your favorite sides, like guacamole or Mexican rice, and enjoy your beef tacos!',
    ],
  ),

  Recipe(
    name: 'Avocado Toast',
    imageUrl: 'assets/avocado_toast.jpeg',
    isVegan: true,
    isGlutenFree: false,
    isVegetarian: false,
    ingredients: [
      '2 slices of Bread (whole grain, gluten-free, or your choice)',
      '1 ripe Avocado',
      '1/2 Lemon (for juice)',
      'Salt (to taste)',
      'Pepper (to taste)',
      'Red pepper flakes (optional)',
      'Toppings (optional): sliced tomatoes, poached eggs, microgreens',
    ],
    steps: [
      '1. Toast the bread slices until golden brown and crispy.',
      '2. While the bread is toasting, cut the avocado in half and remove the pit. Scoop the flesh into a bowl.',
      '3. Mash the avocado with a fork and squeeze in some fresh lemon juice to prevent browning.',
      '4. Season with salt, pepper, and red pepper flakes (if desired). Mix well.',
      '5. Spread the mashed avocado evenly onto the toasted bread slices.',
      '6. Optionally, top with sliced tomatoes, a poached egg, or microgreens for added flavor and texture.',
      '7. Serve immediately and enjoy a delicious, healthy avocado toast!',
    ],
  ),
  Recipe(
    name: 'Chicken Salad',
    imageUrl: 'assets/chicken_salad.jpeg',
    isVegan: false,
    isGlutenFree: true,
    isVegetarian: false,
    ingredients: [
      '2 Chicken breasts (boneless, skinless)',
      '1 head of Lettuce (chopped)',
      '2 Tomatoes (diced)',
      '1 Cucumber (sliced)',
      '1/4 Red onion (thinly sliced)',
      '1/4 cup of Salad dressing (Ranch, Caesar, or your preferred choice)',
      'Salt and pepper to taste',
      'Olive oil (for grilling)',
    ],
    steps: [
      '1. Grill the chicken breasts: Heat a grill or grill pan over medium-high heat. Season the chicken breasts with a bit of salt, pepper, and olive oil. Grill the chicken for about 6-7 minutes per side or until the internal temperature reaches 165°F (74°C). Remove the chicken from the grill and let it rest for 5 minutes before slicing it into thin strips or cubes.',
      '2. Prepare the salad ingredients: While the chicken is resting, wash and chop the lettuce into bite-sized pieces. Dice the tomatoes, slice the cucumber, and thinly slice the red onion.',
      '3. Assemble the salad: In a large bowl, add the chopped lettuce, diced tomatoes, sliced cucumber, and red onion. Toss the vegetables gently to combine.',
      '4. Add the chicken: Place the sliced or cubed grilled chicken on top of the salad.',
      '5. Dress the salad: Drizzle the salad dressing of your choice over the top. Toss everything together gently to coat the salad evenly with the dressing.',
      '6. Serve and enjoy: Serve the chicken salad immediately, or chill it in the fridge for 10-15 minutes before serving for a refreshing dish.',
    ],
  ),
  Recipe(
    name: 'Vegetarian Chili',
    imageUrl: 'assets/vegetarian_chili.jpeg',
    isVegan: true,
    isGlutenFree: true,
    isVegetarian: true,
    ingredients: [
      '1 tbsp Olive oil',
      '1 Onion (diced)',
      '2 cloves Garlic (minced)',
      '1 Red bell pepper (diced)',
      '1 Zucchini (diced)',
      '1 can Diced tomatoes (14.5 oz)',
      '1 can Black beans (15 oz, drained and rinsed)',
      '1 can Kidney beans (15 oz, drained and rinsed)',
      '1 cup Vegetable broth',
      '1 tbsp Chili powder',
      '1 tsp Cumin',
      'Salt and pepper to taste',
      'Fresh cilantro (optional, for garnish)',
    ],
    steps: [
      '1. Heat the olive oil in a large pot over medium heat.',
      '2. Add the diced onion and sauté for 3-4 minutes until softened.',
      '3. Add the garlic, red bell pepper, and zucchini. Cook for another 5 minutes, stirring occasionally.',
      '4. Add the diced tomatoes, black beans, kidney beans, and vegetable broth. Stir in the chili powder, cumin, salt, and pepper.',
      '5. Bring the chili to a boil, then reduce the heat and simmer for 20-25 minutes, allowing the flavors to meld together.',
      '6. Taste and adjust the seasoning as needed.',
      '7. Serve with a sprinkle of fresh cilantro, and enjoy your hearty vegetarian chili!',
    ],
  ),

  Recipe(
    name: 'Spinach and Ricotta Stuffed Shells',
    imageUrl: 'assets/spinach_ricotta_stuffed_shells.jpeg',
    isVegan: false,
    isGlutenFree: false,
    isVegetarian: true,
    ingredients: [
      '1 package Jumbo pasta shells (about 20 shells)',
      '2 cups Ricotta cheese',
      '1 cup Mozzarella cheese (shredded)',
      '1/2 cup Parmesan cheese (grated)',
      '2 cups Fresh spinach (chopped)',
      '1 Egg',
      '1 jar Marinara sauce',
      '1/2 tsp Garlic powder',
      '1/2 tsp Salt',
      '1/4 tsp Black pepper',
      'Fresh basil (optional, for garnish)',
    ],
    steps: [
      '1. Preheat the oven to 375°F (190°C).',
      '2. Cook the jumbo pasta shells according to package instructions, then drain and set aside.',
      '3. In a large bowl, combine the ricotta cheese, shredded mozzarella, grated Parmesan, chopped spinach, egg, garlic powder, salt, and pepper.',
      '4. Stuff each cooked pasta shell with the ricotta and spinach mixture and place them in a greased baking dish.',
      '5. Pour marinara sauce over the stuffed shells and cover the dish with aluminum foil.',
      '6. Bake for 25-30 minutes, removing the foil during the last 5 minutes to allow the cheese to brown and bubble.',
      '7. Garnish with fresh basil and serve warm.',
    ],
  ),

  Recipe(
    name: 'Vegetarian Tacos',
    imageUrl: 'assets/vegetarian_tacos.jpeg',
    isVegan: true,
    isGlutenFree: false,
    isVegetarian: true,
    ingredients: [
      '1 can Black beans (15 oz, drained and rinsed)',
      '1 Red bell pepper (diced)',
      '1 Yellow onion (diced)',
      '1 tbsp Olive oil',
      '1 tsp Chili powder',
      '1/2 tsp Cumin',
      '1/4 tsp Paprika',
      'Salt and pepper to taste',
      '10 Soft corn tortillas',
      '1/2 cup Avocado (sliced)',
      '1/2 cup Fresh salsa',
      'Cilantro (optional, for garnish)',
      'Lime wedges (for serving)',
    ],
    steps: [
      '1. Heat olive oil in a large skillet over medium heat.',
      '2. Add the diced onion and red bell pepper and sauté for 3-4 minutes, until softened.',
      '3. Add the black beans, chili powder, cumin, paprika, salt, and pepper to the skillet. Stir and cook for another 5 minutes, until heated through.',
      '4. While the beans are cooking, warm the tortillas in a dry skillet or in the microwave.',
      '5. To assemble the tacos, spoon the bean mixture into each tortilla, and top with sliced avocado and fresh salsa.',
      '6. Garnish with cilantro and serve with lime wedges for an extra burst of flavor.',
    ],
  ),

  Recipe(
    name: 'Caprese Salad',
    imageUrl: 'assets/caprese_salad.jpeg',
    isVegan: false,
    isGlutenFree: true,
    isVegetarian: true,
    ingredients: [
      '2 large Tomatoes (sliced)',
      '1 ball Fresh mozzarella cheese (sliced)',
      'Fresh basil leaves',
      '2 tbsp Balsamic vinegar',
      '2 tbsp Olive oil',
      'Salt and pepper to taste',
    ],
    steps: [
      '1. Arrange the sliced tomatoes and mozzarella cheese on a serving platter, alternating between the two.',
      '2. Tuck fresh basil leaves between the tomato and cheese slices.',
      '3. Drizzle olive oil and balsamic vinegar over the salad.',
      '4. Season with salt and pepper to taste.',
      '5. Serve immediately as a light, refreshing appetizer or side dish.',
    ],
  ),

  Recipe(
    name: 'Apple Cinnamon Oatmeal',
    imageUrl: 'assets/apple_cinnamon_oatmeal.jpeg',
    isVegan: true,
    isGlutenFree: false,
    isVegetarian: true,
    ingredients: [
      '1 cup Rolled oats',
      '2 cups Almond milk',
      '1 Apple (peeled, cored, and chopped)',
      '1/2 tsp Cinnamon',
      '1 tbsp Maple syrup',
      '1/4 cup Walnuts (optional, for topping)',
      '1 tbsp Raisins (optional, for topping)',
    ],
    steps: [
      '1. In a saucepan, combine the rolled oats and almond milk. Bring to a simmer over medium heat.',
      '2. Stir occasionally and cook for about 5-7 minutes, until the oats are tender and the mixture thickens.',
      '3. In a separate pan, sauté the chopped apple with cinnamon until softened, about 3-4 minutes.',
      '4. Once the oats are cooked, mix in the sautéed apples and maple syrup.',
      '5. Serve with walnuts and raisins on top for extra crunch and sweetness.',
    ],
  ),

  Recipe(
    name: 'Sweet Potato and Black Bean Enchiladas',
    imageUrl: 'assets/sweet_potato_black_bean_enchiladas.jpeg',
    isVegan: true,
    isGlutenFree: true,
    isVegetarian: true,
    ingredients: [
      '2 medium Sweet potatoes (peeled and cubed)',
      '1 can Black beans (15 oz, drained and rinsed)',
      '1 can Enchilada sauce (14 oz)',
      '8 Corn tortillas',
      '1/2 tsp Cumin',
      '1/4 tsp Chili powder',
      'Salt and pepper to taste',
      '1/2 cup Fresh cilantro (chopped, for garnish)',
      '1/4 cup Red onion (diced, optional, for topping)',
    ],
    steps: [
      '1. Preheat the oven to 400°F (200°C).',
      '2. Toss the sweet potato cubes in olive oil, cumin, chili powder, salt, and pepper. Spread them out on a baking sheet and roast for 20-25 minutes, or until tender.',
      '3. While the sweet potatoes are roasting, warm the corn tortillas in a dry skillet or the microwave until soft.',
      '4. In a large bowl, mix the roasted sweet potatoes with the black beans.',
      '5. Pour a little enchilada sauce into the bottom of a baking dish. Fill each tortilla with the sweet potato and black bean mixture and roll them up. Place the filled tortillas seam-side down in the baking dish.',
      '6. Pour the remaining enchilada sauce over the top of the tortillas.',
      '7. Cover with aluminum foil and bake for 20 minutes.',
      '8. Garnish with fresh cilantro and diced red onion, and serve!',
    ],
  ),
  Recipe(
    name: 'Mango Chia Pudding',
    imageUrl: 'assets/mango_chia_pudding.jpeg',
    isVegan: true,
    isGlutenFree: true,
    isVegetarian: true,
    ingredients: [
      '1 cup Coconut milk',
      '1/2 cup Chia seeds',
      '1 tbsp Maple syrup',
      '1/2 tsp Vanilla extract',
      '1 Mango (peeled and diced)',
      '1/4 cup Shredded coconut (optional, for garnish)',
      'Fresh mint (optional, for garnish)',
    ],
    steps: [
      '1. In a bowl, mix the coconut milk, chia seeds, maple syrup, and vanilla extract.',
      '2. Stir well to combine and let it sit for 5 minutes. Stir again to prevent clumps.',
      '3. Cover and refrigerate the chia pudding for at least 4 hours, or overnight.',
      '4. When ready to serve, top with fresh mango, shredded coconut, and mint leaves.',
      '5. Enjoy your healthy, refreshing breakfast!',
    ],
  ),

  Recipe(
    name: 'Overnight Oats',
    imageUrl: 'assets/overnight_oats.jpeg',
    isVegan: true,
    isGlutenFree: true,
    isVegetarian: true,
    ingredients: [
      '1/2 cup Rolled oats',
      '1/2 cup Almond milk',
      '1/4 cup Greek yogurt (or non-dairy yogurt for vegan)',
      '1 tbsp Chia seeds',
      '1 tbsp Maple syrup',
      '1/2 tsp Vanilla extract',
      '1/4 cup Mixed berries (optional)',
      '1 tbsp Almond butter',
      '1/4 cup Sliced almonds (optional, for topping)',
    ],
    steps: [
      '1. In a jar or container, combine the rolled oats, almond milk, Greek yogurt, chia seeds, maple syrup, and vanilla extract.',
      '2. Stir everything together until well mixed.',
      '3. Cover the container with a lid or plastic wrap and refrigerate overnight (or for at least 4 hours).',
      '4. In the morning, give the oats a good stir, and top with mixed berries, almond butter, and sliced almonds.',
      '5. Enjoy a quick, healthy breakfast!',
    ],
  ),
];
