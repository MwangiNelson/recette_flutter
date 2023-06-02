import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recette_flutter/models/recipe_model.dart';
import 'package:recette_flutter/screens/components/recipe_card.dart';
import 'package:recette_flutter/screens/test.dart';
import 'package:recette_flutter/screens/recipes_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(255, 189, 0, 1),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color.fromRGBO(255, 189, 0, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Discover',
                    style: GoogleFonts.sarabun(
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 20.0,
                ),
                Text('RECCETTE',
                    style: GoogleFonts.abel(
                      fontSize: 40.0,
                      color: Colors.black,
                    )),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            width: 5.0, color: Colors.black54)),
                    prefixIcon: const Icon(EvaIcons.search),
                    hintText: "Search..."),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.075,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => RecipesPage())),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.purple.shade900,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          margin: const EdgeInsets.all(10.0),
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Center(
                              child: Text(
                            "All",
                            style: GoogleFonts.sarabun(
                                fontSize: 15.0, color: Colors.white),
                          )),
                        ));
                  }),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular",
                                style: GoogleFonts.sarabun(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Test())),
                                child: const Text("See more"),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2.5,
                          color: Colors.orange[500],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: _buildTopRecipes())
                      ]),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Latest picks",
                                  style: GoogleFonts.sarabun(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Test())),
                                  child: const Text("See more"),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2.5,
                            color: Colors.orange[500],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: _buildLatestRecipes())
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(255, 189, 0, 1),
        elevation: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(255, 189, 0, 1),
            icon: Icon(EvaIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.bookmark),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_add),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildTopRecipes() {
    if (recipes.recipes.isEmpty) {
      return const Center(
        child:
            CircularProgressIndicator(), // Display a loading indicator while fetching recipes
      );
    } else {
      return ListView.builder(
        itemCount: recipes.recipes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var recipe = recipes.recipes[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RecipeCard(
              title: recipe['title'].toString().toUpperCase(),
              url: recipe['image_url'],
              author: recipe['author'],
              recipe: recipe,
            ),
          );
        },
      );
    }
  }

  Widget _buildLatestRecipes() {
    if (recipes.latestRecipes.isEmpty) {
      return const Center(
        child:
            CircularProgressIndicator(), // Display a loading indicator while fetching recipes
      );
    } else {
      return ListView.builder(
        itemCount: recipes.latestRecipes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var recipe = recipes.latestRecipes[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RecipeCard(
              title: recipe['title'].toString().toUpperCase(),
              url: recipe['image_url'],
              author: recipe['author'],
              recipe: recipe,
            ),
          );
        },
      );
    }
  }
}
