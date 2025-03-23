import 'package:flutter/material.dart';
import 'recipe.dart';
import 'detail.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RecipeList(),
    );
  }
}

class RecipeList extends StatefulWidget {
  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  // Sample recipe list
  List<Recipe> recipes = [
    Recipe(
  name: 'Vegetable Stir-Fry',
  imageUrl: 'assets/vegetable_stir_fry.jpeg',
  isVegan: true,
  isGlutenFree: true,
  isVegeterian: true,
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
    'Cooked rice or noodles (for serving)'
  ],
  steps: [
    '1. Heat the olive oil and sesame oil (if using) in a large pan or wok over medium heat.',
    '2. Add the sliced onion, bell pepper, and grated ginger (if using). Sauté for 2-3 minutes until the vegetables begin to soften.',
    '3. Add the sliced carrots and broccoli florets to the pan. Continue cooking and stirring for 5-7 minutes until the vegetables are tender but still crisp.',
    '4. Add minced garlic to the pan and cook for an additional 1 minute until fragrant.',
    '5. Pour the soy sauce over the vegetables and stir well to coat them evenly.',
    '6. Serve the stir-fry over cooked rice or noodles and garnish with sesame seeds, if desired.',
    '7. Enjoy your delicious, healthy vegetable stir-fry!'
  ],
),

Recipe(
  name: 'Grilled Salmon',
  imageUrl: 'assets/grilled_salmon.jpeg',
  isVegan: false,
  isGlutenFree: true,
  isVegeterian: false,
  ingredients: [
    '2 Salmon fillets',
    '1 Lemon (cut into wedges)',
    '2 cloves Garlic (minced)',
    '1 tbsp Olive oil',
    '1 tsp Salt',
    '1/2 tsp Pepper',
    '1 tsp Fresh dill (optional, for garnish)'
  ],
  steps: [
    '1. Preheat your grill to medium-high heat.',
    '2. Brush the salmon fillets with olive oil and season with salt, pepper, and minced garlic.',
    '3. Place the salmon fillets on the grill, skin-side down, and grill for 4-5 minutes on each side. The fish is done when it flakes easily with a fork and has an internal temperature of 145°F (63°C).',
    '4. Remove the salmon from the grill and let it rest for a few minutes.',
    '5. Squeeze fresh lemon juice over the salmon fillets for added flavor.',
    '6. Garnish with fresh dill and serve with your favorite sides, like roasted vegetables or a simple salad.',
    '7. Enjoy your perfectly grilled salmon!'
  ],
),

Recipe(
  name: 'Pasta Primavera',
  imageUrl: 'assets/pasta_primavera.jpeg',
  isVegan: true,
  isGlutenFree: false,
  isVegeterian: true,
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
    'Nutritional yeast or vegan cheese (optional, for topping)'
  ],
  steps: [
    '1. Cook the pasta according to package instructions, then drain and set aside.',
    '2. While the pasta is cooking, heat the olive oil in a large skillet over medium heat.',
    '3. Add minced garlic and sauté for 1-2 minutes, until fragrant.',
    '4. Add the zucchini slices and cherry tomatoes to the skillet and cook for 3-4 minutes, until they begin to soften.',
    '5. Stir in the fresh spinach and cook until wilted, about 2 minutes.',
    '6. Season with salt and pepper, and then toss the cooked pasta into the skillet with the vegetables.',
    '7. Stir in fresh basil and mix everything together.',
    '8. Serve with a sprinkle of nutritional yeast or vegan cheese if desired, and enjoy your light and fresh pasta primavera!'
  ],
),

Recipe(
  name: 'Beef Tacos',
  imageUrl: 'assets/beef_tacos.jpeg',
  isVegan: false,
  isGlutenFree: false,
  isVegeterian: false,
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
    '1 tbsp Olive oil (for cooking the beef)'
  ],
  steps: [
    '1. Heat olive oil in a large skillet over medium heat.',
    '2. Add the ground beef and cook until browned, breaking it apart with a spatula as it cooks (about 7-8 minutes). Drain any excess fat.',
    '3. Stir in the taco seasoning mix and follow the instructions on the packet (usually adding water and simmering for 3-5 minutes).',
    '4. While the beef simmers, warm the taco shells in the oven according to the package instructions.',
    '5. Once the beef is ready, spoon it into the warmed taco shells.',
    '6. Top each taco with shredded lettuce, cheese, diced tomato, sour cream, and salsa.',
    '7. Optionally, add chopped onions for extra flavor.',
    '8. Serve with your favorite sides, like guacamole or Mexican rice, and enjoy your beef tacos!'
  ],
),

Recipe(
  name: 'Avocado Toast',
  imageUrl: 'assets/avocado_toast.jpeg',
  isVegan: true,
  isGlutenFree: false,
  isVegeterian: false,
  ingredients: [
    '2 slices of Bread (whole grain, gluten-free, or your choice)',
    '1 ripe Avocado',
    '1/2 Lemon (for juice)',
    'Salt (to taste)',
    'Pepper (to taste)',
    'Red pepper flakes (optional)',
    'Toppings (optional): sliced tomatoes, poached eggs, microgreens'
  ],
  steps: [
    '1. Toast the bread slices until golden brown and crispy.',
    '2. While the bread is toasting, cut the avocado in half and remove the pit. Scoop the flesh into a bowl.',
    '3. Mash the avocado with a fork and squeeze in some fresh lemon juice to prevent browning.',
    '4. Season with salt, pepper, and red pepper flakes (if desired). Mix well.',
    '5. Spread the mashed avocado evenly onto the toasted bread slices.',
    '6. Optionally, top with sliced tomatoes, a poached egg, or microgreens for added flavor and texture.',
    '7. Serve immediately and enjoy a delicious, healthy avocado toast!'
  ],
),
    Recipe(
  name: 'Chicken Salad',
  imageUrl: 'assets/chicken_salad.jpeg',
  isVegan: false,
  isGlutenFree: true,
  isVegeterian: false,
  ingredients: [
    '2 Chicken breasts (boneless, skinless)',
    '1 head of Lettuce (chopped)',
    '2 Tomatoes (diced)',
    '1 Cucumber (sliced)',
    '1/4 Red onion (thinly sliced)',
    '1/4 cup of Salad dressing (Ranch, Caesar, or your preferred choice)',
    'Salt and pepper to taste',
    'Olive oil (for grilling)'
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
  isVegeterian: true,
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
    'Fresh cilantro (optional, for garnish)'
  ],
  steps: [
    '1. Heat the olive oil in a large pot over medium heat.',
    '2. Add the diced onion and sauté for 3-4 minutes until softened.',
    '3. Add the garlic, red bell pepper, and zucchini. Cook for another 5 minutes, stirring occasionally.',
    '4. Add the diced tomatoes, black beans, kidney beans, and vegetable broth. Stir in the chili powder, cumin, salt, and pepper.',
    '5. Bring the chili to a boil, then reduce the heat and simmer for 20-25 minutes, allowing the flavors to meld together.',
    '6. Taste and adjust the seasoning as needed.',
    '7. Serve with a sprinkle of fresh cilantro, and enjoy your hearty vegetarian chili!'
  ],
),

Recipe(
  name: 'Spinach and Ricotta Stuffed Shells',
  imageUrl: 'assets/spinach_ricotta_stuffed_shells.jpeg',
  isVegan: false,
  isGlutenFree: false,
  isVegeterian: true,
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
    'Fresh basil (optional, for garnish)'
  ],
  steps: [
    '1. Preheat the oven to 375°F (190°C).',
    '2. Cook the jumbo pasta shells according to package instructions, then drain and set aside.',
    '3. In a large bowl, combine the ricotta cheese, shredded mozzarella, grated Parmesan, chopped spinach, egg, garlic powder, salt, and pepper.',
    '4. Stuff each cooked pasta shell with the ricotta and spinach mixture and place them in a greased baking dish.',
    '5. Pour marinara sauce over the stuffed shells and cover the dish with aluminum foil.',
    '6. Bake for 25-30 minutes, removing the foil during the last 5 minutes to allow the cheese to brown and bubble.',
    '7. Garnish with fresh basil and serve warm.'
  ],
),

Recipe(
  name: 'Vegetarian Tacos',
  imageUrl: 'assets/vegetarian_tacos.jpeg',
  isVegan: true,
  isGlutenFree: false,
  isVegeterian: true,
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
    'Lime wedges (for serving)'
  ],
  steps: [
    '1. Heat olive oil in a large skillet over medium heat.',
    '2. Add the diced onion and red bell pepper and sauté for 3-4 minutes, until softened.',
    '3. Add the black beans, chili powder, cumin, paprika, salt, and pepper to the skillet. Stir and cook for another 5 minutes, until heated through.',
    '4. While the beans are cooking, warm the tortillas in a dry skillet or in the microwave.',
    '5. To assemble the tacos, spoon the bean mixture into each tortilla, and top with sliced avocado and fresh salsa.',
    '6. Garnish with cilantro and serve with lime wedges for an extra burst of flavor.'
  ],
),

Recipe(
  name: 'Caprese Salad',
  imageUrl: 'assets/caprese_salad.jpeg',
  isVegan: false,
  isGlutenFree: true,
  isVegeterian: true,
  ingredients: [
    '2 large Tomatoes (sliced)',
    '1 ball Fresh mozzarella cheese (sliced)',
    'Fresh basil leaves',
    '2 tbsp Balsamic vinegar',
    '2 tbsp Olive oil',
    'Salt and pepper to taste'
  ],
  steps: [
    '1. Arrange the sliced tomatoes and mozzarella cheese on a serving platter, alternating between the two.',
    '2. Tuck fresh basil leaves between the tomato and cheese slices.',
    '3. Drizzle olive oil and balsamic vinegar over the salad.',
    '4. Season with salt and pepper to taste.',
    '5. Serve immediately as a light, refreshing appetizer or side dish.'
  ],
),

Recipe(
  name: 'Sweet Potato and Black Bean Enchiladas',
  imageUrl: 'assets/sweet_potato_black_bean_enchiladas.jpeg',
  isVegan: true,
  isGlutenFree: true,
  isVegeterian: true,
  ingredients: [
    '2 medium Sweet potatoes (peeled and cubed)',
    '1 can Black beans (15 oz, drained and rinsed)',
    '1 can Enchilada sauce (14 oz)',
    '8 Corn tortillas',
    '1/2 tsp Cumin',
    '1/4 tsp Chili powder',
    'Salt and pepper to taste',
    '1/2 cup Fresh cilantro (chopped, for garnish)',
    '1/4 cup Red onion (diced, optional, for topping)'
  ],
  steps: [
    '1. Preheat the oven to 400°F (200°C).',
    '2. Toss the sweet potato cubes in olive oil, cumin, chili powder, salt, and pepper. Spread them out on a baking sheet and roast for 20-25 minutes, or until tender.',
    '3. While the sweet potatoes are roasting, warm the corn tortillas in a dry skillet or the microwave until soft.',
    '4. In a large bowl, mix the roasted sweet potatoes with the black beans.',
    '5. Pour a little enchilada sauce into the bottom of a baking dish. Fill each tortilla with the sweet potato and black bean mixture and roll them up. Place the filled tortillas seam-side down in the baking dish.',
    '6. Pour the remaining enchilada sauce over the top of the tortillas.',
    '7. Cover with aluminum foil and bake for 20 minutes.',
    '8. Garnish with fresh cilantro and diced red onion, and serve!'
  ],
),
  ];

  List<String> filters = ['All', 'Vegan', 'Gluten-Free', 'Vegeterian'];
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    var filteredRecipes = recipes;

    // Filter recipes based on selected filter
    if (selectedFilter == 'Vegan') {
      filteredRecipes = recipes.where((recipe) => recipe.isVegan).toList();
    } else if (selectedFilter == 'Gluten-Free') {
      filteredRecipes = recipes.where((recipe) => recipe.isGlutenFree).toList();
    } else if (selectedFilter == 'Vegeterian') {
      filteredRecipes = recipes.where((recipe) => recipe.isVegeterian).toList();
    }

    return Scaffold(
  backgroundColor: Colors.lightBlueAccent,
  appBar: AppBar(
    title: Text('Recipe Finder'),
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  body: Column(
    children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          value: selectedFilter,
          onChanged: (String? newValue) {
            setState(() {
              selectedFilter = newValue!;
            });
          },
          items: filters.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: (filteredRecipes.length / 3).ceil(), // Number of rows
          itemBuilder: (context, rowIndex) {
            int startIndex = rowIndex * 3;
            int endIndex = (startIndex + 3).clamp(0, filteredRecipes.length);
            List recipesInRow = filteredRecipes.sublist(startIndex, endIndex);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 200, // Height for each row
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recipesInRow.length,
                  itemBuilder: (context, index) {
                    final recipe = recipesInRow[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetail(recipe: recipe),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                recipe.imageUrl,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              recipe.name,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${recipe.ingredients.length} Ingredients',
                              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
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