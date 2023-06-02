import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recette_flutter/screens/components/display_card.dart';
import 'package:recette_flutter/screens/components/recipe_card.dart';
import 'package:recette_flutter/models/recipe_model.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key});

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  Recipes recipesList = Recipes();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipes(); // Call the fetchRecipes method to retrieve the recipes
  }

  Future<void> fetchRecipes() async {
    setState(() {
      isLoading = true; // Set isLoading to true to show the loader
    });

    await recipesList
        .fetchRecipes(); // Await the fetchRecipes method to complete

    setState(() {
      isLoading = false; // Set isLoading to false to hide the loader
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 189, 0, 1),
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 189, 0, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore recipes",
              style: GoogleFonts.sarabun(fontSize: 40.0),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1.0,
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                      child:
                          CircularProgressIndicator(), // Show the loader when isLoading is true
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0, // Adjust the spacing as needed
                        crossAxisSpacing: 10.0, // Adjust the spacing as needed
                      ),
                      itemCount:
                          recipesList.allRecipes.length, // Number of recipes
                      itemBuilder: (BuildContext context, int index) {
                        final recipe = recipesList.allRecipes[index];
                        return DisplayCard(
                          title: recipe['title'].toString().toUpperCase(),
                          url: recipe['image_url'],
                          author: recipe['author'],
                          recipe: recipe,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
