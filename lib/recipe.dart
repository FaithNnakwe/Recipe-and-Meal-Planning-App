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
List<Recipe> recipes = [
  Recipe(
  name: 'Vegetable Stir-Fry',
  imageUrl: 'assets/vegetable_stir_fry.jpeg',
  isVegan: true,
  isGlutenFree: true,
  isVegetarian: true,
  ingredients: [
    'Bell pepper',
    'Broccoli',
    'Carrots',
    'Onion',
    'Soy sauce',
    'Olive oil',
    'Sesame oil (optional)',
    'Garlic cloves',
    'Ginger (optional)',
    'Sesame seeds (optional, for garnish)',
    'Cooked rice or noodles (for serving)'
  ],
  steps: [
    '1. Heat 2 tbsp olive oil and 1 tsp sesame oil (if using) in a large pan or wok over medium heat.',
    '2. Add 1 sliced onion, 1 sliced bell pepper, and 1 tsp grated ginger (if using). Sauté for 2-3 minutes until the vegetables begin to soften.',
    '3. Add 2 sliced carrots and 1 head of broccoli (cut into florets). Continue cooking and stirring for 5-7 minutes until tender but still crisp.',
    '4. Add 1 minced garlic clove and cook for an additional minute until fragrant.',
    '5. Pour 2 tbsp gluten-free soy sauce over the vegetables and stir well to coat.',
    '6. Serve the stir-fry over cooked rice or noodles and garnish with 1 tbsp sesame seeds, if desired.',
    '7. Enjoy your delicious, healthy vegetable stir-fry!'
  ],
),

Recipe(
  name: 'Grilled Salmon',
  imageUrl: 'assets/grilled_salmon.jpeg',
  isVegan: false,
  isGlutenFree: true,
  isVegetarian: false,
  ingredients: [
    'Salmon fillets',
    'Lemon',
    'Garlic cloves',
    'Olive oil',
    'Salt',
    'Pepper',
    'Fresh dill (optional, for garnish)'
  ],
  steps: [
    '1. Preheat your grill to medium-high heat.',
    '2. Brush 2 salmon fillets with 1 tbsp olive oil and season with 1 tsp salt, 1/2 tsp pepper, and 2 minced garlic cloves.',
    '3. Place the fillets skin-side down and grill for 4-5 minutes on each side, or until the internal temperature reaches 145°F (63°C).',
    '4. Remove from the grill and let rest for a few minutes.',
    '5. Squeeze fresh lemon juice over the salmon.',
    '6. Garnish with 1 tsp fresh dill and serve with your favorite sides.',
    '7. Enjoy your perfectly grilled salmon!'
  ],
),


Recipe(
  name: 'Pasta Primavera',
  imageUrl: 'assets/pasta_primavera.jpeg',
  isVegan: true,
  isGlutenFree: false,
  isVegetarian: true,
  ingredients: [
    'Pasta (spaghetti, penne, or gluten-free pasta)',
    'Cherry tomatoes',
    'Zucchini',
    'Fresh spinach',
    'Garlic cloves',
    'Olive oil',
    'Salt',
    'Pepper',
    'Fresh basil',
    'Nutritional yeast or vegan cheese'
  ],
  steps: [
    '1. Cook 8 oz of pasta (spaghetti, penne, or gluten-free) according to package instructions, then drain and set aside.',
    '2. While the pasta is cooking, heat 2 tbsp of olive oil in a large skillet over medium heat.',
    '3. Add 2 cloves of minced garlic and sauté for 1-2 minutes, until fragrant.',
    '4. Add 1 sliced zucchini and 1 cup of halved cherry tomatoes to the skillet. Cook for 3-4 minutes, until they begin to soften.',
    '5. Stir in 2 cups of chopped fresh spinach and cook until wilted, about 2 minutes.',
    '6. Season with 1/2 tsp of salt and 1/4 tsp of pepper, then toss the cooked pasta into the skillet with the vegetables.',
    '7. Stir in 1/4 cup of chopped fresh basil and mix everything together.',
    '8. Serve with a sprinkle of nutritional yeast or vegan cheese if desired, and enjoy your light and fresh pasta primavera!'
  ],
),

Recipe(
  name: 'Beef Tacos',
  imageUrl: 'assets/beef_tacos.jpeg',
  isVegan: false,
  isGlutenFree: false,
  isVegetarian: false,
  ingredients: [
    'Ground beef',
    'Taco seasoning mix',
    'Taco shells',
    'Shredded lettuce',
    'Shredded cheese (cheddar or Mexican blend)',
    'Sour cream',
    'Salsa',
    'Tomato',
    'Onions (optional)',
    'Olive oil (for cooking the beef)'
  ],
  steps: [
    '1. Heat 1 tsbsp olive oil in a large skillet over medium heat.',
    '2. Add 1 lb of ground beef and cook until browned, breaking it apart with a spatula as it cooks (about 7-8 minutes). Drain any excess fat.',
    '3. Stir in 1 packet of taco seasoning mix and follow the instructions on the packet (usually adding water and simmering for 3-5 minutes).',
    '4. While the beef simmers, warm about taco shells in the oven according to the package instructions.',
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
  isVegetarian: false,
  ingredients: [
    'Bread',
    'Avocado',
    'Lemon',
    'Salt',
    'Pepper',
    'Red pepper flakes',
    'Tomatoes', 
    'Poached eggs (Optional)', 
    'Microgreens (Optional)'
  ],
  steps: [
    '1. Toast about 2 bread slices until golden brown and crispy.',
    '2. While the bread is toasting, cut an avocado in half and remove the pit. Scoop the flesh into a bowl.',
    '3. Mash the avocado with a fork and squeeze in 1/2 a lemon for fresh lemon juice to prevent browning.',
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
  isVegetarian: false,
  ingredients: [
    'Chicken breasts',
    'head of Lettuce',
    'Tomatoes',
    'Cucumber',
    'Red onion',
    'Salad dressing',
    'Salt',
    'Pepper',
    'Olive oil '
  ],
  steps: [
    '1. Grill 2 chicken breasts: Heat a grill or grill pan over medium-high heat. Season the chicken breasts with a bit of salt, pepper, and olive oil. Grill the chicken for about 6-7 minutes per side or until the internal temperature reaches 165°F (74°C). Remove the chicken from the grill and let it rest for 5 minutes before slicing it into thin strips or cubes.',
    '2. Prepare the salad ingredients: While the chicken is resting, wash and chop 1 head of lettuce into bite-sized pieces. Dice 2 tomatoes, slice 1 cucumber, and thinly slice 1/4 of the red onion.',
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
    'Olive oil',
    'Onions',
    'Garlic clove',
    'Bell pepper',
    'Zucchini',
    'Tomatoes',
    'Black beans',
    'Kidney beans',
    'Vegetable broth',
    'Chili powder',
    'Cumin',
    'Salt',
    'Pepper',
    'Fresh cilantro'
  ],
  steps: [
    '1. Heat 1 tbsp olive oil in a large pot over medium heat.',
    '2. Add 1 diced onion and sauté for 3-4 minutes until softened.',
    '3. Add 2 cloves minced garlic, 1 diced red bell pepper, and 1 diced zucchini. Cook for another 5 minutes, stirring occasionally.',
    '4. Add 1 can (14.5 oz) diced tomatoes, 1 can (15 oz) black beans, 1 can (15 oz) kidney beans, and 1 cup vegetable broth. Stir in 1 tbsp chili powder, 1 tsp cumin, and salt and pepper to taste.',
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
  isVegetarian: true,
  ingredients: [
    'Jumbo pasta shells',
    'Ricotta cheese',
    'Mozzarella cheese',
    'Parmesan cheese ',
    'Fresh spinach',
    'Egg',
    'Marinara sauce',
    'Garlic powder',
    'Salt',
    'Black pepper',
    'Fresh basil'
  ],
  steps: [
    '1. Preheat the oven to 375°F (190°C).',
    '2. Cook about 20 jumbo pasta shells according to package instructions, then drain and set aside.',
    '3. In a large bowl, combine 2 cups ricotta cheese, 1 cup shredded mozzarella, 1/2 cup grated Parmesan, 2 cups chopped fresh spinach, 1 egg, 1/2 tsp garlic powder, 1/2 tsp salt, and 1/4 tsp black pepper.',
    '4. Stuff each cooked pasta shell with the ricotta and spinach mixture and place them in a greased baking dish.',
    '5. Pour 1 jar marinara sauce over the stuffed shells and cover the dish with aluminum foil.',
    '6. Bake for 25-30 minutes, removing the foil during the last 5 minutes to allow the cheese to brown and bubble.',
    '7. Garnish with fresh basil and serve warm.'
  ],
),


Recipe(
  name: 'Vegetarian Tacos',
  imageUrl: 'assets/vegetarian_tacos.jpeg',
  isVegan: true,
  isGlutenFree: false,
  isVegetarian: true,
  ingredients: [
    'Black beans',
    'Bell pepper',
    'Yellow onion',
    'Olive oil',
    'Chili powder',
    'Cumin',
    'Paprika',
    'Salt',
    'Pepper',
    'Soft corn tortillas',
    'Avocado',
    'Salsa',
    'Cilantro',
    'Lime wedges'
  ],
  steps: [
    '1. Heat 1 tbsp olive oil in a large skillet over medium heat.',
    '2. Add 1 diced yellow onion and 1 diced red bell pepper and sauté for 3-4 minutes, until softened.',
    '3. Add 1 can (15 oz) drained and rinsed black beans, 1 tsp chili powder, 1/2 tsp cumin, 1/4 tsp paprika, and salt and pepper to taste to the skillet. Stir and cook for another 5 minutes, until heated through.',
    '4. While the beans are cooking, warm 10 soft corn tortillas in a dry skillet or in the microwave.',
    '5. To assemble the tacos, spoon the bean mixture into each tortilla, and top with 1/2 cup sliced avocado and 1/2 cup fresh salsa.',
    '6. Garnish with cilantro and serve with lime wedges for an extra burst of flavor.'
  ],
),

Recipe( 
  name: 'Breakfast Burrito', 
  imageUrl: 'assets/breakfast_burrito.jpeg', 
  isVegan: false, 
  isGlutenFree: false, 
  isVegetarian: true, 
  ingredients: [ 
    'Tortillas', 
    'Eggs', 
    'Cheddar cheese', 
    'Salsa', 
    'Avocado', 
    'Bell pepper', 
    'Red Onions', 
    'Olive oil' ], 
    steps: [ 
      '1. Heat olive oil in a skillet over medium heat and sauté 1/4 cup diced bell pepper and 1/4 cup diced red onion until softened (about 3-4 minutes).', 
      '2. In a separate bowl, whisk 2 large eggs and pour them into the skillet with the vegetables. Cook until scrambled and set aside.', 
      '3. Warm the flour tortilla in a separate pan for 30 seconds on each side.', 
      '4. Once the tortilla is warm, layer with scrambled eggs, 1/4 cup shredded cheddar cheese, salsa, and diced avocado.', 
      '5. Roll up the tortilla, folding in the sides as you go, to form a burrito.', 
      '6. Serve immediately and enjoy a hearty breakfast!' ], ),

Recipe(
  name: 'Caprese Salad',
  imageUrl: 'assets/caprese_salad.jpeg',
  isVegan: false,
  isGlutenFree: true,
  isVegetarian: true,
  ingredients: [
    'Tomatoes ',
    'Fresh mozzarella cheese',
    'Fresh basil',
    'Balsamic vinegar',
    'Olive oil',
    'Salt',
    'Pepper'
  ],
  steps: [
    '1. Arrange 2 large sliced tomatoes and 1 sliced ball fresh mozzarella cheese on a serving platter, alternating between the two.',
    '2. Tuck fresh basil leaves between the tomato and cheese slices.',
    '3. Drizzle 2 tbsp olive oil and 2 tbsp balsamic vinegar over the salad.',
    '4. Season with salt and pepper to taste.',
    '5. Serve immediately as a light, refreshing appetizer or side dish.'
  ],
),

Recipe(
  name: 'Apple Cinnamon Oatmeal',
  imageUrl: 'assets/apple_cinnamon_oatmeal.jpeg',
  isVegan: true,
  isGlutenFree: false,
  isVegetarian: true,
  ingredients: [
    'Rolled oats',
    'Almond milk',
    'Apple',
    'Cinnamon',
    'Maple syrup',
    'Walnuts',
    'Raisins'
  ],
  steps: [
    '1. In a saucepan, combine 1 cup rolled oats and 2 cups almond milk. Bring to a simmer over medium heat.',
    '2. Stir occasionally and cook for about 5-7 minutes, until the oats are tender and the mixture thickens.',
    '3. In a separate pan, sauté 1 chopped and peeled apple with 1/2 tsp cinnamon until softened, about 3-4 minutes.',
    '4. Once the oats are cooked, mix in the sautéed apples and 1 tbsp maple syrup.',
    '5. Serve with 1/4 cup walnuts and 1 tbsp raisins on top for extra crunch and sweetness.'
  ],
),

Recipe(
  name: 'Sweet Potato and Black Bean Enchiladas',
  imageUrl: 'assets/sweet_potato_black_bean_enchiladas.jpeg',
  isVegan: true,
  isGlutenFree: true,
  isVegetarian: true,
  ingredients: [
    'Sweet potatoes',
    'Black beans',
    'Enchilada sauce',
    'Corn tortillas',
    'Cumin',
    'Chili powder',
    'Salt',
    'Pepper',
    'Fresh cilantro',
    'Red onion'
  ],
  steps: [
    '1. Preheat the oven to 400°F (200°C).',
    '2. Toss 2 medium cubed sweet potatoes ( washed and peeled) in olive oil, 1/2 tsp cumin, 1/4 tsp chili powder, salt, and pepper. Spread them out on a baking sheet and roast for 20-25 minutes, or until tender.',
    '3. While the sweet potatoes are roasting, warm 8 corn tortillas in a dry skillet or the microwave until soft.',
    '4. In a large bowl, mix the roasted sweet potatoes with 1 can (15 oz) black beans.',
    '5. Pour a little 14 oz enchilada sauce into the bottom of a baking dish. Fill each tortilla with the sweet potato and black bean mixture and roll them up. Place the filled tortillas seam-side down in the baking dish.',
    '6. Pour the remaining enchilada sauce over the top of the tortillas.',
    '7. Cover with aluminum foil and bake for 20 minutes.',
    '8. Garnish with fresh cilantro and diced red onion, and serve!'
  ],
),

Recipe(
  name: 'Mango Chia Pudding',
  imageUrl: 'assets/mango_chia_pudding.jpeg',
  isVegan: true,
  isGlutenFree: true,
  isVegetarian: true,
  ingredients: [
    'Coconut milk',
    'Chia seeds',
    'Maple syrup',
    'Vanilla extract',
    'Mango',
    'Shredded coconut',
    'Fresh mint'
  ],
  steps: [
    '1. In a bowl, mix 1 cup coconut milk, 1/2 cup chia seeds, 1 tbsp maple syrup, and 1/2 tsp vanilla extract.',
    '2. Stir well to combine and let it sit for 5 minutes. Stir again to prevent clumps.',
    '3. Cover and refrigerate the chia pudding for at least 4 hours, or overnight.',
    '4. When ready to serve, top with fresh 1 diced mango, 1/4 cup shredded coconut, and mint leaves.',
    '5. Enjoy your healthy, refreshing breakfast!'
  ],
),

Recipe(
  name: 'Overnight Oats',
  imageUrl: 'assets/overnight_oats.jpeg',
  isVegan: true,
  isGlutenFree: true,
  isVegetarian: true,
  ingredients: [
    'Rolled oats',
    'Almond milk',
    'Greek yogurt',
    'Chia seeds',
    'Maple syrup',
    'Vanilla extract',
    'Mixed berries',
    'Almond butter',
    'Sliced almonds'
  ],
  steps: [
    '1. In a jar or container, combine 1/2 cup rolled oats, 1/2 cup almond milk, 1/4 cup Greek yogurt, 1 tbsp chia seeds, 1 tbsp maple syrup, and 1/2 tsp vanilla extract.',
    '2. Stir everything together until well mixed.',
    '3. Cover the container with a lid or plastic wrap and refrigerate overnight (or for at least 4 hours).',
    '4. In the morning, give the oats a good stir, and top with 1/4 cup mixed berries, 1 tbsp almond butter, and 1/4 cup sliced almonds.',
    '5. Enjoy a quick, healthy breakfast!'
  ],
),
Recipe( name: 'Cinnamon Apple Quinoa', 
imageUrl: 'assets/cinnamon_apple_quinoa.jpeg', 
isVegan: true, 
isGlutenFree: true, 
isVegetarian: true, 
ingredients: [ 
  'Quinoa', 
  'Apple', 
  'Cinnamon', 
  'Maple syrup', 
  'Almond milk', 
  'Chopped walnuts' 
  ], 
  steps: [ 
    '1. Cook quinoa according to package instructions using almond milk instead of water.', 
    '2. While quinoa is cooking, dice the apple and sauté with a pinch of cinnamon in a pan for 3-4 minutes.', 
    '3. Once the quinoa is cooked, mix in the sautéed apples and cinnamon.', 
    '4. Drizzle with maple syrup and sprinkle with chopped walnuts.', 
    '5. Serve warm for a cozy, nutritious breakfast!' ],
     ),

  Recipe( 
    name: 'Peanut Butter Banana Smoothie', 
    imageUrl: 'assets/peanut_butter_banana_smoothie.jpeg', 
    isVegan: true, 
    isGlutenFree: true, 
    isVegetarian: true, 
    ingredients: [ 
      'Bananas', 
      'Peanut butter', 
      'Almond milk', 
      'Chia seeds', 
      'Ice cubes' ], 
      steps: [ 
        '1. In a blender, combine bananas, peanut butter, almond milk, chia seeds, and ice cubes.', 
        '2. Blend until smooth and creamy.', 
        '3. Pour into a glass and enjoy a delicious and filling breakfast smoothie!'
         ],),

Recipe( 
  name: 'Egg Muffins', 
  imageUrl: 'assets/egg_muffins.jpeg',
   isVegan: false, 
   isGlutenFree: true, 
   isVegetarian: true, 
   ingredients: [ 
   'Eggs', 
   'Bell peppers', 
   'Red onions', 
   'Fresh spinach', 
   'Cheddar cheese', 
   'Salt',
   'Pepper', 
   'Olive oil spray' ], 
   steps: [ 
    '1. Preheat the oven to 375°F (190°C) and grease a muffin tin with olive oil spray.', 
    '2. In a bowl, whisk together 6 large eggs and season with salt and pepper.', 
    '3. Stir in 1/2 cup diced bell pepper, 1/4 cup diced red onion, 1/4 cup chopped spinach, and 1/4 cup shredded cheddar cheese.', 
    '4. Pour the egg mixture evenly into 6 muffin cups.', 
    '5. Bake for 18-20 minutes, or until the eggs are fully set and slightly golden on top.', 
    '6. Allow the muffins to cool for a few minutes before removing from the tin.', 
    '7. Enjoy warm, or refrigerate for a quick breakfast throughout the week!' ], ), 

Recipe(
  name: 'BBQ Chicken Sliders',
  imageUrl: 'assets/bbq_chicken_sliders.jpeg',
  isVegan: false,
  isGlutenFree: false,
  isVegetarian: false,
  ingredients: [
    'Rotisserie chicken',
    'BBQ sauce',
    'Slider buns',
    'Coleslaw',
    'Pickle slices',
    'Cheddar cheese'
  ],
  steps: [
    '1. Mix 2 cups of shredded rotisserie chicken with 1/2 cup BBQ sauce in a bowl until fully coated.',
    '2. Toast the 6 slider buns lightly in a skillet or oven for 2-3 minutes.',
    '3. Spoon the BBQ chicken onto the bottom half of each slider bun, about 1/4 cup per slider.',
    '4. Top with a slice of cheddar cheese, a spoonful (about 1 tablespoon) of coleslaw, and a pickle slice.',
    '5. Place the top bun on and serve as a delicious finger food!'
  ],
),

Recipe(
  name: 'Creamy Tomato Basil Pasta',
  imageUrl: 'assets/tomato_basil_pasta.jpeg',
  isVegan: false,
  isGlutenFree: false,
  isVegetarian: true,
  ingredients: [
    'Pasta',
    'Olive oil',
    'Garlic cloves',
    'Tomatoes',
    'Fresh basil',
    'Heavy cream',
    'Parmesan cheese',
    'Salt',
    'Black pepper'
  ],
  steps: [
    '1. Cook 8 oz of Pasta according to package instructions. Drain and set aside.',
    '2. Heat 2 tablespoons of olive oil in a pan over medium heat and sauté 3 cloves of minced garlic until fragrant, about 1 minute.',
    '3. Add 1 can (14 oz) of crushed tomatoes, salt, and black pepper. Simmer for 10 minutes, stirring occasionally.',
    '4. Stir in 1/2 cup of heavy cream and 1/4 cup of fresh chopped basil, then let it simmer for an additional 5 minutes.',
    '5. Toss the cooked pasta into the sauce and mix well until the pasta is fully coated.',
    '6. Top with 1/4 cup of freshly grated Parmesan cheese and additional fresh basil if desired.',
    '7. Serve hot and enjoy a creamy, comforting meal!'
  ],
),

];
