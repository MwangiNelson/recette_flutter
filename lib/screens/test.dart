import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Recipes recipes = Recipes();

  @override
  void initState() {
    super.initState();
    fetchRecipes(); // Call the fetchRecipes method to retrieve the recipes
  }

  Future<void> fetchRecipes() async {
    await recipes.fetchRecipes(); // Await the fetchRecipes method to complete
    setState(
        () {}); // Trigger a state update to re-render the UI with the fetched recipes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: _buildRecipeList(),
    );
  }

  Widget _buildRecipeList() {
    if (recipes.recipes.isEmpty) {
      return const Center(
        child:
            CircularProgressIndicator(), // Display a loading indicator while fetching recipes
      );
    } else {
      return ListView.builder(
        itemCount: recipes.recipes.length,
        itemBuilder: (context, index) {
          var recipe = recipes.recipes[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.network(recipe['image_url'])),
          );
        },
      );
    }
  }
}
